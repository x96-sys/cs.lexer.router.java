package org.x96.sys.foundation.buzz.cs.lexer.router.serial;

import org.x96.sys.foundation.buzz.Buzz;
import org.x96.sys.foundation.cs.lexer.router.serial.architecture.Step;

public class BuzzUnexpectedTokenForVisitor extends Buzz {
    public static final int CODE = 0x71;

    public BuzzUnexpectedTokenForVisitor(Step step) {
        super(CODE, BuzzUnexpectedTokenForVisitor.class.getSimpleName(), explain(step));
    }

    private static String explain(Step step) {
        return String.format(
                "Current Visitor [%s] [%s] not found a valid token.",
                step.visitor.getSimpleName(), step.quantifier);
    }
}
