package org.x96.sys.foundation.cs.lexer.router.switcher;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.x96.sys.foundation.buzz.cs.lexer.router.switcher.BuzzSwitcherEmpty;
import org.x96.sys.lexer.token.Token;
import org.x96.sys.lexer.tokenizer.Tokenizer;
import org.x96.sys.foundation.cs.lexer.visitor.entry.terminals.c0.Etx;
import org.x96.sys.foundation.cs.lexer.visitor.entry.terminals.c0.Stx;
import org.x96.sys.io.ByteStream;

class SwitcherTest {
    @Test
    void happySwitcher() {
        Tokenizer tokenizer = new Tokenizer(ByteStream.raw(new byte[] { 0x2 }));
        Switcher switcher = new Switcher();
        switcher.know(Stx.class);
        switcher.know(Etx.class);
        assertEquals(Stx.class, switcher.visitorTo(tokenizer.look()));
    }

    @Test
    void happyStream() {
        Tokenizer tokenizer = new Tokenizer(ByteStream.raw(new byte[] { 0x2 }));
        Switcher switcher = new Switcher();
        switcher.know(Stx.class);
        switcher.know(Etx.class);
        Token[] tokens = switcher.stream(tokenizer);
        assertEquals(1, tokens.length);
        assertEquals("Token { Kind[STX] Lexeme[0x2] Span[{0:0 0}:{1:1 1}] }", tokens[0].toString());
    }

    @Test
    void happyBuzzSwitcherEmpty() {
        Tokenizer tokenizer = new Tokenizer(ByteStream.raw(new byte[] { 0x2 }));
        Switcher switcher = new Switcher();
        switcher.know(Stx.class);
        assertEquals(Stx.class, switcher.visitorTo(tokenizer.look()));
        assertThrows(BuzzSwitcherEmpty.class, () -> switcher.visitorTo(tokenizer.look()));
    }
}
