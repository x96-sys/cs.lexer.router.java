package org.x96.sys.buzz.router.switcher;

import org.x96.sys.buzz.Buzz;

public class BuzzSwitcherEmpty extends Buzz {
    public static final int CODE = 0x76;

    public BuzzSwitcherEmpty() {
        super(CODE, BuzzSwitcherEmpty.class.getSimpleName(), "?");
    }
}
