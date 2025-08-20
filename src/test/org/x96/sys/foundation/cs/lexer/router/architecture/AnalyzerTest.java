package org.x96.sys.foundation.cs.lexer.router.architecture;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.x96.sys.foundation.buzz.cs.lexer.router.architecture.BuzzAmbiguousVisitor;
import org.x96.sys.foundation.buzz.cs.lexer.router.architecture.BuzzAnalyzerEmpty;
import org.x96.sys.foundation.cs.lexer.router.Router;
import org.x96.sys.foundation.cs.lexer.token.Token;
import org.x96.sys.foundation.cs.lexer.tokenizer.Tokenizer;
import org.x96.sys.foundation.cs.lexer.visitor.entry.Terminal;
import org.x96.sys.foundation.cs.lexer.visitor.entry.terminals.c0.Stx;

class AnalyzerTest {

    @Test
    void happyBuzzAmbiguousVisitor() {
        Router r =
                new Router() {
                    @Override
                    public Token[] stream(Tokenizer tokenizer) {
                        return new Token[0];
                    }
                };
        r.clean();
        r.know(Stx.class);
        r.know(Terminal.class);
        var e = assertThrows(BuzzAmbiguousVisitor.class, () -> Analyzer.build(r));
        String expected =
                """
                🦕 [0xA2]
                🐝 [BuzzAmbiguousVisitor]
                🌵 > [Terminal] tenta registrar [0x2] [\u0002] que já é respondido por [Stx]
                   > {current table} [3]
                       > [Terminal] #[0x0–0x1]
                       > [Stx] #[0x2]\
                """;
        assertEquals(expected, e.getMessage());
    }

    @Test
    void happyBuzzAnalyzerEmpty() {
        Router r =
                new Router() {
                    @Override
                    public Token[] stream(Tokenizer tokenizer) {
                        return new Token[0];
                    }
                };
        var e = assertThrows(BuzzAnalyzerEmpty.class, () -> Analyzer.build(r));
        assertEquals(
                """
                🦕 [0xA1]
                🐝 [BuzzAnalyzerEmpty]
                🌵 > Nenhum visitante registrado.\
                """,
                e.getMessage());

        r.clean();
        e = assertThrows(BuzzAnalyzerEmpty.class, () -> Analyzer.build(r));
        assertEquals(
                """
                🦕 [0xA1]
                🐝 [BuzzAnalyzerEmpty]
                🌵 > Nenhum visitante registrado.\
                """,
                e.getMessage());
    }
}
