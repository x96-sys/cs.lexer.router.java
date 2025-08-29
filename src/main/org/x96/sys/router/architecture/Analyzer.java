package org.x96.sys.router.architecture;

import org.x96.sys.buzz.router.architecture.BuzzAmbiguousVisitor;
import org.x96.sys.buzz.router.architecture.BuzzAnalyzerEmpty;
import org.x96.sys.router.Router;
import org.x96.sys.lexer.tokenizer.Tokenizer;
import org.x96.sys.lexer.visitor.Visiting;
import org.x96.sys.lexer.visitor.Visitor;
import org.x96.sys.lexer.visitor.factory.ReflectiveVisitorFactory;
import org.x96.sys.io.ByteStream;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public final class Analyzer {

    public static Map<Integer, Class<? extends Visitor>> build(Router dispatcher) {
        if (dispatcher.visitors == null || dispatcher.visitors.length == 0) {
            throw new BuzzAnalyzerEmpty();
        }

        Map<Integer, Class<? extends Visitor>> table = new java.util.HashMap<>();
        for (int i = 0; i < 0xFF; i++) {
            Tokenizer tokenizer = new Tokenizer(ByteStream.raw(new byte[] { (byte) i }));

            for (Class<? extends Visitor> cls : dispatcher.visitors) {

                Visiting visitor = ReflectiveVisitorFactory.happens(cls, tokenizer);
                if (visitor.allowed()) {
                    if (table.containsKey(i)) {
                        throw new BuzzAmbiguousVisitor(table, cls, i);
                    } else {
                        table.put(i, cls);
                    }
                }
            }
        }
        return table;
    }

    public static Byte[] discovery(Class<? extends Visitor> v, int from, int to) {
        List<Byte> l = new LinkedList<>();
        for (int i = from; i < to; i++) {
            Tokenizer t = new Tokenizer(ByteStream.raw(new byte[] { (byte) i }));
            if (ReflectiveVisitorFactory.happens(v, t).allowed()) {
                l.add((byte) i);
            }
        }
        return l.toArray(Byte[]::new);
    }
}
