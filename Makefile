BUILD_DIR     = out
MAIN_BUILD    = $(BUILD_DIR)/main
CLI_BUILD     = $(BUILD_DIR)/cli
TEST_BUILD    = $(BUILD_DIR)/test

SRC_MAIN      = src/main
SRC_CLI       = src/cli
SRC_TEST      = src/test

TOOL_DIR      = tools
LIB_DIR       = lib

BUZZ_VERSION = 0.1.2
BUZZ_JAR     = $(LIB_DIR)/org.x96.sys.foundation.buzz.jar
BUZZ_URL     = https://github.com/x96-sys/buzz.java/releases/download/v$(BUZZ_VERSION)/org.x96.sys.foundation.buzz.jar
BUZZ_SHA256  = 085d3e0045c7e5a5d3a10a43459f58945e08915ca130747cb3a3f9cbbf74dd36

IO_VERSION = 1.0.2
IO_JAR     = $(LIB_DIR)/org.x96.sys.foundation.io.jar
IO_URL     = https://github.com/x96-sys/io.java/releases/download/v$(IO_VERSION)/org.x96.sys.foundation.io.jar
IO_SHA256  = b1d4744f813dfb7a00237de28d5b3b2f5c831d470f8a34901a0c9b4057fd486b

KIND_VERSION = 0.1.3
KIND_JAR     = $(LIB_DIR)/org.x96.sys.foundation.cs.lexer.token.kind.jar
KIND_URL     = https://github.com/x96-sys/cs.lexer.token.kind.java/releases/download/$(KIND_VERSION)/org.x96.sys.foundation.cs.lexer.token.kind.jar
KIND_SHA256  = 269317df6833c28202d9a695a91a89340c0027d10874d57770f2626a8eb7f5fe

TOKENIZER_VERSION = 0.1.7
TOKENIZER_JAR     = $(LIB_DIR)/org.x96.sys.foundation.cs.lexer.tokenizer.jar
TOKENIZER_URL     = https://github.com/x96-sys/cs.lexer.tokenizer.java/releases/download/v$(TOKENIZER_VERSION)/org.x96.sys.foundation.cs.lexer.tokenizer.jar
TOKENIZER_SHA256  = 9f32f2e879c06dc7479ea1509bedb794b3bdb189e2c80284d8fd18b95f8ab2df

TOKEN_VERSION = 0.1.3
TOKEN_JAR     = $(LIB_DIR)/org.x96.sys.foundation.cs.lexer.token.jar
TOKEN_URL     = https://github.com/x96-sys/cs.lexer.token.java/releases/download/v$(TOKEN_VERSION)/org.x96.sys.foundation.cs.lexer.token.jar
TOKEN_SHA256  = 7d25aa60fc975b3830bdd07d12dc4717747e03c9e2a94684d110c3238d540752

VISITOR_VERSION = 0.1.6
VISITOR_JAR     = $(LIB_DIR)/org.x96.sys.foundation.cs.lexer.visitor.jar
VISITOR_URL     = https://github.com/x96-sys/cs.lexer.visitor.java/releases/download/v$(VISITOR_VERSION)/org.x96.sys.foundation.cs.lexer.visitor.jar
VISITOR_SHA256  = 309c5f1eb169dacb184a95a57cb8d513f5daabbcdaa3ba092f04f332236a7467

LEXER_VERSION = 0.1.5
LEXER_JAR     = $(LIB_DIR)/org.x96.sys.foundation.cs.lexer.dsl.jar
LEXER_URL     = https://github.com/x96-sys/cs.lexer.dsl.java/releases/download/v$(LEXER_VERSION)/org.x96.sys.foundation.cs.lexer.dsl.jar
LEXER_SHA256  = 9d6454666d374ef88b726b75f9db6193e40f154f0680181f67733dcb4f8af10b

ENTRY_VERSION = 0.1.3
ENTRY_JAR     = $(LIB_DIR)/org.x96.sys.foundation.cs.lexer.entry.jar
ENTRY_URL     = https://github.com/x96-sys/cs.lexer.visitor.entry.java/releases/download/v$(ENTRY_VERSION)/org.x96.sys.foundation.cs.lexer.entry.jar
ENTRY_SHA256  = c4b88c7836d8123714ca2d1cc373b43439db19fa9052b6159d987e6622b461bb

JUNIT_VERSION = 1.13.4
JUNIT_JAR     = $(TOOL_DIR)/junit-platform-console-standalone.jar
JUNIT_URL     = https://maven.org/maven2/org/junit/platform/junit-platform-console-standalone/$(JUNIT_VERSION)/junit-platform-console-standalone-$(JUNIT_VERSION).jar
JUNIT_SHA256  = 3fdfc37e29744a9a67dd5365e81467e26fbde0b7aa204e6f8bbe79eeaa7ae892

GJF_VERSION = 1.28.0
GJF_JAR     = $(TOOL_DIR)/google-java-format.jar
GJF_URL     = https://maven.org/maven2/com/google/googlejavaformat/google-java-format/$(GJF_VERSION)/google-java-format-$(GJF_VERSION)-all-deps.jar
GJF_SHA256  = 32342e7c1b4600f80df3471da46aee8012d3e1445d5ea1be1fb71289b07cc735

JACOCO_VERSION = 0.8.13
JACOCO_BASE    = https://maven.org/maven2/org/jacoco

JACOCO_CLI_VERSION = $(JACOCO_VERSION)
JACOCO_CLI_JAR     = $(TOOL_DIR)/jacococli.jar
JACOCO_CLI_URL     = $(JACOCO_BASE)/org.jacoco.cli/$(JACOCO_CLI_VERSION)/org.jacoco.cli-$(JACOCO_CLI_VERSION)-nodeps.jar
JACOCO_CLI_SHA256  = 8f748683833d4dc4d72cea5d6b43f49344687b831e0582c97bcb9b984e3de0a3

JACOCO_AGENT_VERSION = $(JACOCO_VERSION)
JACOCO_AGENT_JAR     = $(TOOL_DIR)/jacocoagent-runtime.jar
JACOCO_AGENT_URL     = $(JACOCO_BASE)/org.jacoco.agent/$(JACOCO_AGENT_VERSION)/org.jacoco.agent-$(JACOCO_AGENT_VERSION)-runtime.jar
JACOCO_AGENT_SHA256  = 47e700ccb0fdb9e27c5241353f8161938f4e53c3561dd35e063c5fe88dc3349b

JAVA_SOURCES     = $(shell find $(SRC_MAIN) -name "*.java")
JAVA_TEST_SOURCE = $(shell find $(SRC_TEST) -name "*.java")

DISTRO_JAR = org.x96.sys.foundation.cs.lexer.router.jar

CP = $(BUZZ_JAR):$(IO_JAR):$(KIND_JAR):$(TOKENIZER_JAR):$(TOKEN_JAR):$(VISITOR_JAR):$(LEXER_JAR)
CPT = $(JUNIT_JAR):$(ENTRY_JAR):$(CP)

build: libs generate-build-info
	@javac -d $(MAIN_BUILD) -cp $(CP) $(JAVA_SOURCES)
	@echo "[🦾] [compiled] [$(MAIN_BUILD)]"

build/test: build tools/junit | $(TEST_BUILD)
	@javac -cp $(MAIN_BUILD):$(CLI_BUILD):$(CPT) -d $(TEST_BUILD) $(JAVA_TEST_SOURCE)
	@echo "[🧰] [compiled] [$(TEST_BUILD)]"

test: build/test
	@java -jar $(JUNIT_JAR) \
     execute \
     --class-path :$(TEST_BUILD):$(MAIN_BUILD):$(CPT) \
     --scan-class-path

COVERAGE_EXEC = $(BUILD_DIR)/jacoco.exec
COVERAGE_REPORT = $(BUILD_DIR)/coverage

$(COVERAGE_REPORT):
	@mkdir -p $(COVERAGE_REPORT)

coverage: build/test $(COVERAGE_REPORT)
	@echo "[📊] Running tests with JaCoCo agent..."
	@java -javaagent:$(JACOCO_AGENT_JAR)=destfile=$(COVERAGE_EXEC) \
		-jar $(JUNIT_JAR) \
		execute \
		--class-path $(TEST_BUILD):$(MAIN_BUILD):$(CPT) \
		--scan-class-path
	@echo "[📑] Generating coverage report..."
	@java -jar $(JACOCO_CLI_JAR) report $(COVERAGE_EXEC) \
		--classfiles $(MAIN_BUILD) \
		--sourcefiles $(SRC_MAIN) \
		--html $(COVERAGE_REPORT) \
		--xml  $(COVERAGE_REPORT)/coverage.xml \
		--csv  $(COVERAGE_REPORT)/coverage.csv
	@echo "[✅] Coverage report available in $(COVERAGE_REPORT)/index.html"

test-method: build/test ## Executa teste específico (METHOD="Classe#método")
	@echo "🧪 Executando teste: $(METHOD)"
	@java -jar $(JUNIT_JAR) --class-path $(TEST_BUILD):$(MAIN_BUILD):$(CLI_BUILD):$(CP) --select "method:$(METHOD)"

test-class: build/test ## Executa classe de teste (CLASS="nome.da.Classe")
	@echo "🧪 Executando classe: $(CLASS)"
	@java -jar $(JUNIT_JAR) --class-path $(TEST_BUILD):$(MAIN_BUILD):$(CLI_BUILD):$(CP) --select "class:$(CLASS)"

format: tools/gjf ## Formata todo o código fonte Java com google-java-format
	find src -name "*.java" -print0 | xargs -0 java -jar $(GJF_JAR) --aosp --replace

build-info: generate-build-info ## Força a regeneração do BuildInfo

define deps
$1/$2: $1
	@expected="$($3_SHA256)"; \
	jar="$($3_JAR)"; \
	url="$($3_URL)"; \
	tmp="$$$$(mktemp)"; \
	if [ ! -f "$$$$jar" ]; then \
		echo "[📦] [🚛] [$($3_VERSION)] [$2]"; \
		curl -sSL -o "$$$$tmp" "$$$$url"; \
		actual="$$$$(shasum -a 256 $$$$tmp | awk '{print $$$$1}')"; \
		if [ "$$$$expected" = "$$$$actual" ]; then mv "$$$$tmp" "$$$$jar"; \
		echo "[📦] [📍] [$($3_VERSION)] [$2] [🐚]"; else rm "$$$$tmp"; \
		echo "[❌] [hash mismatch] [$2]"; exit 1; fi; \
	else \
		actual="$$$$(shasum -a 256 $$$$jar | awk '{print $$$$1}')"; \
		if [ "$$$$expected" = "$$$$actual" ]; \
		then echo "[📦] [📍] [$($3_VERSION)] [🐚] [$2]"; \
		else \
			echo "[❌] [hash mismatch] [$2]"; \
			curl -sSL -o "$$$$tmp" "$$$$url"; \
			actual="$$$$(shasum -a 256 $$$$tmp | awk '{print $$$$1}')"; \
			if [ "$$$$expected" = "$$$$actual" ]; then mv "$$$$tmp" "$$$$jar"; \
			echo "[📦] [♻️] [$($3_VERSION)] [🐚] [$2]"; else rm "$$$$tmp"; \
			echo "[❌] [download failed] [$2]"; exit 1; fi; \
		fi; \
	fi
endef

$(eval $(call deps,$(LIB_DIR),buzz,BUZZ))
$(eval $(call deps,$(LIB_DIR),io,IO))
$(eval $(call deps,$(LIB_DIR),kind,KIND))
$(eval $(call deps,$(LIB_DIR),tokenizer,TOKENIZER))
$(eval $(call deps,$(LIB_DIR),token,TOKEN))
$(eval $(call deps,$(LIB_DIR),visitor,VISITOR))
$(eval $(call deps,$(LIB_DIR),lexer,LEXER))
$(eval $(call deps,$(LIB_DIR),entry,ENTRY))

libs:	$(LIB_DIR)/buzz \
	$(LIB_DIR)/io \
	$(LIB_DIR)/kind \
	$(LIB_DIR)/tokenizer \
	$(LIB_DIR)/token \
	$(LIB_DIR)/visitor \
	$(LIB_DIR)/lexer \
	$(LIB_DIR)/entry

$(eval $(call deps,$(TOOL_DIR),gjf,GJF))
$(eval $(call deps,$(TOOL_DIR),junit,JUNIT))
$(eval $(call deps,$(TOOL_DIR),jacoco_cli,JACOCO_CLI))
$(eval $(call deps,$(TOOL_DIR),jacoco_agent,JACOCO_AGENT))

kit: \
	$(TOOL_DIR)/gjf \
	$(TOOL_DIR)/junit \
	$(TOOL_DIR)/jacoco_cli \
	$(TOOL_DIR)/jacoco_agent

generate-build-info:
	@echo "[🔧] [BuildInfo]"
	@mkdir -p $(SRC_MAIN)/org/x96/sys/foundation
	@printf 'package org.x96.sys.foundation;\n\n' > $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java
	@printf '/**\n * Informações de build geradas automaticamente pelo Makefile\n * Não edite este arquivo manualmente!\n */\n' >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java
	@printf 'public final class BuildInfo {\n' >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java
	@if command -v git >/dev/null 2>&1 && git rev-parse --git-dir >/dev/null 2>&1; then \
    	VERSION=$$(git describe --tags --always --dirty 2>/dev/null || echo "v0.1.0-unknown"); \
    	if echo "$$VERSION" | grep -q "^v[0-9]"; then \
      		MAJOR=$$(echo "$$VERSION" | sed 's/^v\([0-9]*\)\..*/\1/'); \
      		MINOR=$$(echo "$$VERSION" | sed 's/^v[0-9]*\.\([0-9]*\)\..*/\1/'); \
      		PATCH=$$(echo "$$VERSION" | sed 's/^v[0-9]*\.[0-9]*\.\([0-9]*\).*/\1/'); \
    	else \
      		MAJOR="0"; MINOR="1"; PATCH="0"; \
    	fi; \
  	else \
    	VERSION="v0.1.0-no-git"; \
    	MAJOR="0"; MINOR="1"; PATCH="0"; \
  	fi; \
    BUILD_DATE=$$(date '+%Y-%m-%d %H:%M:%S'); \
    BUILD_USER=$$(whoami); \
    printf '    public static final String VERSION = "%s";\n' "$$VERSION" >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java; \
    printf '    public static final String BUILD_DATE = "%s";\n' "$$BUILD_DATE" >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java; \
    printf '    public static final String BUILD_USER = "%s";\n' "$$BUILD_USER" >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java; \
    printf '    public static final String VERSION_MAJOR = "%s";\n' "$$MAJOR" >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java; \
    printf '    public static final String VERSION_MINOR = "%s";\n' "$$MINOR" >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java; \
    printf '    public static final String VERSION_PATCH = "%s";\n' "$$PATCH" >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java
	@printf '\n    private BuildInfo() {\n        // Classe utilitária - não deve ser instanciada\n    }\n\n' >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java
	@printf '    public static String getFullVersion() {\n' >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java
	@printf '        return VERSION + " (built on " + BUILD_DATE + " by " + BUILD_USER + ")";\n' >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java
	@printf '    }\n}\n' >> $(SRC_MAIN)/org/x96/sys/foundation/BuildInfo.java
	@echo "[✅] [BuildInfo] gerado com sucesso!"

distro: libs
	@jar cf $(DISTRO_JAR) -C $(MAIN_BUILD) .
	@echo "[📦] [bin] [$(DISTRO_JAR)]"

clean:
	@rm -rf $(BUILD_DIR) $(TOOL_DIR) $(LIB_DIR)
	@echo "[🧹][clean] Build directory cleaned."

