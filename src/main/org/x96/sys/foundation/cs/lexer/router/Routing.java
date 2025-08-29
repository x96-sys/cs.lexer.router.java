package org.x96.sys.foundation.cs.lexer.router;

import org.x96.sys.lexer.token.Token;
import org.x96.sys.lexer.tokenizer.Tokenizer;
import org.x96.sys.lexer.visitor.Visiting;

public interface Routing {

    public Class<? extends Visiting> visitorTo(int hex);

    public Token[] stream(Tokenizer tokenizer);

    public void analysis();

    public void clean();
}
