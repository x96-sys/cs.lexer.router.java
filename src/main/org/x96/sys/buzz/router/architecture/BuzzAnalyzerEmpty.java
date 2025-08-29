package org.x96.sys.buzz.router.architecture;

import org.x96.sys.buzz.Buzz;

public class BuzzAnalyzerEmpty extends Buzz {
    private static final int CODE = 0xA1;

    public BuzzAnalyzerEmpty() {
        super(CODE, BuzzAnalyzerEmpty.class.getSimpleName(), "Nenhum visitante registrado.");
    }
}
