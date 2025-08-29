package org.x96.sys.foundation.cs.lexer.router.serial.architecture;

import org.x96.sys.lexer.visitor.Visitor;

public class Step {
    public final Class<? extends Visitor> visitor;
    public final Quantifier quantifier;
    public int count;

    public Step(Class<? extends Visitor> visitor, Quantifier quantifier) {
        this.visitor = visitor;
        this.quantifier = quantifier;
        this.count = 0;
    }

    @Override
    public String toString() {
        return String.format("%s; %s", quantifier, visitor.getSimpleName());
    }
}
