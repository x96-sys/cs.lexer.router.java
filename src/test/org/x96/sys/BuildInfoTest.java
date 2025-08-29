package org.x96.sys.router;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.x96.sys.lexer.visitor.BuildInfo;

public class BuildInfoTest {

    @Test
    void testVersionNotNullOrEmpty() {
        assertNotNull(BuildInfo.VERSION, "VERSION não pode ser nulo");
        assertFalse(BuildInfo.VERSION.isEmpty(), "VERSION não pode ser vazio");
    }

    @Test
    void testRevisionNotNullOrEmpty() {
        assertNotNull(BuildInfo.REVISION, "REVISION não pode ser nulo");
        assertFalse(BuildInfo.REVISION.isEmpty(), "REVISION não pode ser vazio");
    }

    @Test
    void testBuildTimestampFormat() {
        assertNotNull(BuildInfo.BUILD_TIMESTAMP, "BUILD_TIMESTAMP não pode ser nulo");
        assertTrue(
                BuildInfo.BUILD_TIMESTAMP.matches("\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}Z"),
                "BUILD_TIMESTAMP deve estar em formato ISO-8601 UTC");
    }

    @Test
    void testBuildUserNotNullOrEmpty() {
        assertNotNull(BuildInfo.BUILD_USER, "BUILD_USER não pode ser nulo");
        assertFalse(BuildInfo.BUILD_USER.isEmpty(), "BUILD_USER não pode ser vazio");
    }

    @Test
    void testBuildHostNotNullOrEmpty() {
        assertNotNull(BuildInfo.BUILD_HOST, "BUILD_HOST não pode ser nulo");
        assertFalse(BuildInfo.BUILD_HOST.isEmpty(), "BUILD_HOST não pode ser vazio");
    }

    @Test
    void testBuildOSNotNullOrEmpty() {
        assertNotNull(BuildInfo.BUILD_OS, "BUILD_OS não pode ser nulo");
        assertFalse(BuildInfo.BUILD_OS.isEmpty(), "BUILD_OS não pode ser vazio");
    }

    @Test
    void testJavaVersionContainsNumber() {
        assertNotNull(BuildInfo.JAVA_VERSION, "JAVA_VERSION não pode ser nulo");
        assertFalse(BuildInfo.JAVA_VERSION.isEmpty(), "JAVA_VERSION não pode ser vazio");
        assertTrue(
                BuildInfo.JAVA_VERSION.matches(".*\"?\\d+\\.\\d+(?:\\.\\d+)?\"?.*"),
                "JAVA_VERSION deve conter número de versão (ex: 23.0.1 ou \"23.0.1\")");
    }

    @Test
    void testVersionNumbersNonNegative() {
        assertTrue(BuildInfo.VERSION_MAJOR >= 0, "VERSION_MAJOR deve ser >= 0");
        assertTrue(BuildInfo.VERSION_MINOR >= 0, "VERSION_MINOR deve ser >= 0");
        assertTrue(BuildInfo.VERSION_PATCH >= 0, "VERSION_PATCH deve ser >= 0");
    }
}
