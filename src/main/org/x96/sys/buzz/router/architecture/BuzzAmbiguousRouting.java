package org.x96.sys.buzz.router.architecture;

import org.x96.sys.buzz.Buzz;

public class BuzzAmbiguousRouting extends Buzz {
    private static final int CODE = 0xE1;

    public BuzzAmbiguousRouting(String detalhe, BuzzAmbiguousVisitor e) {
        super(CODE, BuzzAmbiguousRouting.class.getSimpleName(), detalhe, e);
    }
}
