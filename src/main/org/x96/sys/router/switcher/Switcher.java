package org.x96.sys.router.switcher;

import org.x96.sys.buzz.router.switcher.BuzzSwitcherEmpty;
import org.x96.sys.router.oracle.Oracle;
import org.x96.sys.lexer.token.Token;
import org.x96.sys.lexer.tokenizer.Tokenizer;
import org.x96.sys.lexer.visitor.Visitor;
import org.x96.sys.lexer.visitor.factory.ReflectiveVisitorFactory;

public class Switcher extends Oracle {

    public Switcher() {
        clean();
    }

    @Override
    public Class<? extends Visitor> visitorTo(int hex) {
        if (this.visitors == null || this.visitors.length == 0) throw new BuzzSwitcherEmpty();
        Class<? extends Visitor> v = dispatcher().getTable().get(hex);
        clean();
        return v;
    }

    @Override
    public Token[] stream(Tokenizer tokenizer) {
        return ReflectiveVisitorFactory.happens(visitorTo(tokenizer.look()), tokenizer).safeVisit();
    }
}
