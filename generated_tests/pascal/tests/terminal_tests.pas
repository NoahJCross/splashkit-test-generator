uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestReadCharIntegration;
begin
    Write("Please type a character: ");
    testChar := ReadChar();
    WriteLine("You typed: ", testChar);
    AssertNotNull(testChar);
end;
procedure TIntegrationTests.TestReadLineIntegration;
begin
    Write("Please enter your name: ");
    testInput := ReadLine();
    AssertNotEquals(testInput, "");
    WriteLine("You entered: ", testInput);
end;
procedure TIntegrationTests.TestTerminalHasInputIntegration;
begin
    Write("Type something and press Enter: ");
    ProcessEvents();
    AssertFalse(TerminalHasInput());
    testInput := ReadLine();
    ProcessEvents();
    AssertTrue(TerminalHasInput());
end;
procedure TIntegrationTests.TestWriteCharIntegration;
begin
    Write("A");
    AssertTrue(TerminalHasInput());
    testChar := ReadChar();
    AssertEquals(testChar, "A");
end;
procedure TIntegrationTests.TestWriteDoubleIntegration;
begin
    Write(3.14);
    AssertTrue(TerminalHasInput());
end;
procedure TIntegrationTests.TestWriteIntIntegration;
begin
    Write(42);
    AssertTrue(TerminalHasInput());
end;
procedure TIntegrationTests.TestWriteIntegration;
begin
    Write("Test String");
    AssertTrue(TerminalHasInput());
    testOutput := ReadLine();
    AssertEquals(testOutput, "Test String");
end;
procedure TIntegrationTests.TestWriteLineCharIntegration;
begin
    WriteLine("A");
    AssertTrue(TerminalHasInput());
    testChar := ReadChar();
    AssertEquals(testChar, "A");
end;
procedure TIntegrationTests.TestWriteLineEmptyIntegration;
begin
    Write("Test line");
    WriteLine();
    Write("Next line");
    AssertTrue(TerminalHasInput());
end;
procedure TIntegrationTests.TestWriteLineDoubleIntegration;
begin
    WriteLine(42.5);
    AssertTrue(TerminalHasInput());
end;
procedure TIntegrationTests.TestWriteLineIntIntegration;
begin
    WriteLine(42);
    AssertTrue(TerminalHasInput());
end;
procedure TIntegrationTests.TestWriteLineIntegration;
begin
    WriteLine("Test Line");
    AssertTrue(TerminalHasInput());
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
