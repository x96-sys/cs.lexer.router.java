package org.x96.sys.foundation.cs.lexer.router.oracle;

import org.x96.sys.foundation.cs.lexer.router.Router;
import org.x96.sys.lexer.token.Token;
import org.x96.sys.lexer.tokenizer.Tokenizer;
import org.x96.sys.lexer.visitor.Visitor;
import org.x96.sys.lexer.visitor.factory.ReflectiveVisitorFactory;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Oracle extends Router {

    public Oracle() {
        clean();
    }

    @Override
    public Class<? extends Visitor> visitorTo(int hex) {
        return dispatcher().getTable().get(hex);
    }

    @Override
    public Token[] stream(Tokenizer tokenizer) {
        List<Token> tokens = new ArrayList<>();
        resolve(tokenizer, tokens);
        return tokens.toArray(new Token[0]);
    }

    private void resolve(Tokenizer t, List<Token> r) {
        if (t.ready()) {
            Class<? extends Visitor> v = visitorTo(t.look());
            if (v == null)
                return;
            r.addAll(Arrays.asList(ReflectiveVisitorFactory.happens(v, t).visit()));
            if (t.ready())
                resolve(t, r);
        }
    }
}
