uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestReadCharIntegration;
begin
    write("Please type a character: ");
    testChar := read_char();
    write_line("You typed: ", testChar);
    AssertNotNull(testChar);
end;
procedure TIntegrationTests.TestReadLineIntegration;
begin
    write("Please enter your name: ");
    testInput := read_line();
    AssertNotEquals(testInput, "");
    write_line("You entered: ", testInput);
end;
procedure TIntegrationTests.TestTerminalHasInputIntegration;
begin
    write("Type something and press Enter: ");
    process_events();
    AssertFalse(terminal_has_input());
    testInput := read_line();
    process_events();
    AssertTrue(terminal_has_input());
end;
procedure TIntegrationTests.TestWriteCharIntegration;
begin
    write("A");
    AssertTrue(terminal_has_input());
    testChar := read_char();
    AssertEquals(testChar, "A");
end;
procedure TIntegrationTests.TestWriteDoubleIntegration;
begin
    write(3.14);
    AssertTrue(terminal_has_input());
end;
procedure TIntegrationTests.TestWriteIntIntegration;
begin
    write(42);
    AssertTrue(terminal_has_input());
end;
procedure TIntegrationTests.TestWriteIntegration;
begin
    write("Test String");
    AssertTrue(terminal_has_input());
    testOutput := read_line();
    AssertEquals(testOutput, "Test String");
end;
procedure TIntegrationTests.TestWriteLineCharIntegration;
begin
    write_line("A");
    AssertTrue(terminal_has_input());
    testChar := read_char();
    AssertEquals(testChar, "A");
end;
procedure TIntegrationTests.TestWriteLineEmptyIntegration;
begin
    write("Test line");
    write_line();
    write("Next line");
    AssertTrue(terminal_has_input());
end;
procedure TIntegrationTests.TestWriteLineDoubleIntegration;
begin
    write_line(42.5);
    AssertTrue(terminal_has_input());
end;
procedure TIntegrationTests.TestWriteLineIntIntegration;
begin
    write_line(42);
    AssertTrue(terminal_has_input());
end;
procedure TIntegrationTests.TestWriteLineIntegration;
begin
    write_line("Test Line");
    AssertTrue(terminal_has_input());
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
