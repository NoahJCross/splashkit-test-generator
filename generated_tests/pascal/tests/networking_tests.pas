uses SplashKit, TestFramework, ../Helpers;
type
    TTestNetworking = class(TTestCase)
    protected
        procedure Setup; override;
    end;
    procedure TestAcceptAllNewConnectionsIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    connectionsAccepted := AcceptAllNewConnections();
    AssertTrue(connectionsAccepted);
end;
procedure TestAcceptNewConnectionIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    connectionAccepted := AcceptNewConnection(testServer);
    AssertTrue(connectionAccepted);
end;
procedure TestBroadcastMessageIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection1 := OpenConnection('test_connection1', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    testConnection2 := OpenConnection('test_connection2', '127.0.0.1', 5000);
    CheckNetworkActivity();
    BroadcastMessage('Test Message', testServer);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection1));
    AssertTrue(HasMessages(testConnection2));
end;
procedure TestBroadcastMessageToAllIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection1 := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    testConnection2 := OpenConnection('test_connection2', '127.0.0.1', 5000);
    CheckNetworkActivity();
    BroadcastMessage('Test Message');
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection1));
    AssertTrue(HasMessages(testConnection2));
end;
procedure TestBroadcastMessageToServerNamedIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    BroadcastMessage('Test Message', 'Test Server');
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection));
end;
procedure TestCheckNetworkActivityIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertTrue(HasNewConnections());
end;
procedure TestClearMessagesFromNameIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection));
    ClearMessages('test_connection');
    CheckNetworkActivity();
    AssertFalse(HasMessages(testConnection));
end;
procedure TestClearMessagesFromConnectionIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection));
    ClearMessages(testConnection);
    AssertFalse(HasMessages(testConnection));
end;
procedure TestClearMessagesFromServerIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 8080);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testServer));
    ClearMessages(testServer);
    CheckNetworkActivity();
    AssertFalse(HasMessages(testServer));
end;
procedure TestCloseAllConnectionsIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertTrue(HasConnection('test_connection'));
    CloseAllConnections();
    CheckNetworkActivity();
    AssertFalse(HasConnection('test_connection'));
end;
procedure TestCloseAllServersIntegration;
begin
    CreateServer('Test Server 1', 5000);
    CleanupServer := TServerCleanup.Create;
    CreateServer('Test Server 2', 5001);
    AssertTrue(HasServer('Test Server 1'));
    AssertTrue(HasServer('Test Server 2'));
    CloseAllServers();
    AssertFalse(HasServer('Test Server 1'));
    AssertFalse(HasServer('Test Server 2'));
end;
procedure TestCloseConnectionIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 8080);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    closeResult := CloseConnection(testConnection);
    AssertTrue(closeResult);
    AssertFalse(IsConnectionOpen(testConnection));
end;
procedure TestCloseConnectionNamedIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 8080);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertTrue(IsConnectionOpen(testConnection));
    closeResult := CloseConnection('test_connection');
    AssertTrue(closeResult);
    AssertFalse(IsConnectionOpen(testConnection));
end;
procedure TestCloseMessageIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages());
    testMessage := ReadMessage();
    AssertNotNull(testMessage);
    CloseMessage(testMessage);
    AssertFalse(HasMessages());
end;
procedure TestCloseServerNamedIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    closeResult := CloseServer('Test Server');
    AssertTrue(closeResult);
    AssertFalse(HasServer('Test Server'));
end;
procedure TestCloseServerIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    closeResult := CloseServer(testServer);
    AssertTrue(closeResult);
    AssertFalse(HasServer('Test Server'));
end;
procedure TestConnectionCountNamedIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertEquals(Cardinal(1), ConnectionCount('Test Server'));
end;
procedure TestConnectionCountIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertEquals(Cardinal(1), ConnectionCount(testServer));
end;
procedure TestConnectionIPIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    testIP := ConnectionIP(testConnection);
    AssertEquals(Cardinal(2130706433), testIP);
end;
procedure TestConnectionIPFromNameIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 8080);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    testIP := ConnectionIP('test_connection');
    AssertEquals(Cardinal(2130706433), testIP);
end;
procedure TestConnectionNamedIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    retrievedConnection := ConnectionNamed('test_connection');
    AssertNotNull(retrievedConnection);
end;
procedure TestConnectionPortIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    testPort := ConnectionPort(testConnection);
    AssertEquals(5000, testPort);
end;
procedure TestConnectionPortFromNameIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    testPort := ConnectionPort('test_connection');
    AssertEquals(5000, testPort);
end;
procedure TestCreateServerWithPortIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    AssertNotNull(testServer);
    AssertTrue(HasServer('Test Server'));
end;
procedure TestCreateServerWithPortAndProtocolIntegration;
begin
    testServer := CreateServer('Test Server', 5000, ConnectionType.TCP);
    CleanupServer := TServerCleanup.Create;
    AssertNotNull(testServer);
    AssertTrue(HasServer('Test Server'));
end;
procedure TestDecToHexIntegration;
begin
    testHexResult := DecToHex(Cardinal(2130706433));
    AssertEquals('0x7F000001', testHexResult);
end;
procedure TestFetchNewConnectionIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    newConnection := FetchNewConnection(testServer);
    AssertNotNull(newConnection);
end;
procedure TestHasConnectionIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 8080);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertTrue(HasConnection('test_connection'));
    CloseConnection(testConnection);
    AssertFalse(HasConnection('test_connection'));
end;
procedure TestHasMessagesIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertFalse(HasMessages());
    SendMessageTo('test_message', testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages());
end;
procedure TestHasMessagesOnConnectionIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testConnection));
end;
procedure TestHasMessagesOnNameIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages('Test Server'));
end;
procedure TestHasMessagesOnServerIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertTrue(HasMessages(testServer));
end;
procedure TestHasNewConnectionsIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertTrue(HasNewConnections());
end;
procedure TestHasServerIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    AssertTrue(HasServer('Test Server'));
    CloseServer(testServer);
    AssertFalse(HasServer('Test Server'));
end;
procedure TestHexStrToIpv4Integration;
begin
    testIpv4 := HexStrToIpv4('0x7F000001');
    AssertEquals('127.0.0.1', testIpv4);
    testIpv4NoPrefix := HexStrToIpv4('7F000001');
    AssertEquals('127.0.0.1', testIpv4NoPrefix);
end;
procedure TestHexToDecStringIntegration;
begin
    testResult := HexToDecString('7F');
    AssertEquals('127', testResult);
    testResultWithPrefix := HexToDecString('0x7F');
    AssertEquals('127', testResultWithPrefix);
end;
procedure TestIpv4ToDecIntegration;
begin
    testResult1 := Ipv4ToDec('127.0.0.1');
    AssertEquals(Cardinal(2130706433), testResult1);
    testResult2 := Ipv4ToDec('192.168.1.1');
    AssertEquals(3232235777, testResult2);
end;
procedure TestIpv4ToHexIntegration;
begin
    testIpv4Hex := Ipv4ToHex('127.0.0.1');
    AssertEquals('0x7F000001', testIpv4Hex);
end;
procedure TestIpv4ToStrIntegration;
begin
    testIPStr := Ipv4ToStr(Cardinal(2130706433));
    AssertEquals('127.0.0.1', testIPStr);
end;
procedure TestIsConnectionOpenIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertTrue(IsConnectionOpen(testConnection));
    CloseConnection(testConnection);
    AssertFalse(IsConnectionOpen(testConnection));
end;
procedure TestIsConnectionOpenFromNameIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertTrue(IsConnectionOpen('test_connection'));
    CloseConnection(testConnection);
    AssertFalse(IsConnectionOpen('test_connection'));
end;
procedure TestLastConnectionNamedIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    testLastConnection := LastConnection('Test Server');
    AssertEquals(testConnection, testLastConnection);
end;
procedure TestLastConnectionIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    testLastConnection := LastConnection(testServer);
    AssertEquals(testConnection, testLastConnection);
end;
procedure TestMessageConnectionIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals(testConnection, MessageConnection(testMessage));
    CloseMessage(testMessage);
end;
procedure TestMessageCountOnServerIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertEquals(Cardinal(1), MessageCount(testServer));
end;
procedure TestMessageCountOnConnectionIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertTrue(MessageCount(testConnection) > 0);
end;
procedure TestMessageCountFromNameIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertEquals(Cardinal(1), MessageCount(testServer));
end;
procedure TestMessageDataIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals('Test Message', MessageData(testMessage));
    CloseMessage(testMessage);
end;
procedure TestMessageDataBytesIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    testMessageBytes := MessageDataBytes(testMessage);
    AssertTrue(Length(testMessageBytes) > 0);
    CloseMessage(testMessage);
end;
procedure TestMessageHostIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals('127.0.0.1', MessageHost(testMessage));
    CloseMessage(testMessage);
end;
procedure TestMessagePortIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals(5000, MessagePort(testMessage));
    CloseMessage(testMessage);
end;
procedure TestMessageProtocolIntegration;
begin
    testServer := CreateServer('Test Server', 5000, ConnectionType.UDP);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000, ConnectionType.UDP);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals(ConnectionType.UDP, MessageProtocol(testMessage));
    CloseMessage(testMessage);
end;
procedure TestMyIPIntegration;
begin
    testIP := MyIP();
    AssertEquals('127.0.0.1', testIP);
end;
procedure TestNameForConnectionIntegration;
begin
    testConnectionName := NameForConnection('localhost', Cardinal(8080));
    AssertEquals('localhost:8080', testConnectionName);
end;
procedure TestNewConnectionCountIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertEquals(1, NewConnectionCount(testServer));
end;
procedure TestOpenConnectionIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 8080);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertNotNull(testConnection);
    AssertTrue(IsConnectionOpen(testConnection));
    CloseConnection(testConnection);
    AssertFalse(IsConnectionOpen(testConnection));
end;
procedure TestOpenConnectionWithProtocolIntegration;
begin
    CreateServer('Test Server', 5000, ConnectionType.TCP);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000, ConnectionType.TCP);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertNotNull(testConnection);
end;
procedure TestReadMessageIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage();
    AssertEquals('Test Message', MessageData(testMessage));
    CloseMessage(testMessage);
end;
procedure TestReadMessageFromConnectionIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testConnection);
    AssertEquals('Test Message', MessageData(testMessage));
    CloseMessage(testMessage);
end;
procedure TestReadMessageFromNameIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage('Test Server');
    AssertEquals('Test Message', MessageData(testMessage));
    CloseMessage(testMessage);
end;
procedure TestReadMessageFromServerIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    testMessage := ReadMessage(testServer);
    AssertEquals('Test Message', MessageData(testMessage));
    CloseConnection(testConnection);
    CloseServer(testServer);
    CloseMessage(testMessage);
end;
procedure TestReadMessageDataFromNameIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertEquals('Test Message', ReadMessageData('Test Server'));
end;
procedure TestReadMessageDataFromConnectionIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertEquals('Test Message', ReadMessageData(testConnection));
end;
procedure TestReadMessageDataFromServerIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertEquals('Test Message', ReadMessageData(testServer));
end;
procedure TestReconnectIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    CloseConnection(testConnection);
    CheckNetworkActivity();
    AssertFalse(IsConnectionOpen(testConnection));
    Reconnect(testConnection);
    CheckNetworkActivity();
    AssertTrue(IsConnectionOpen(testConnection));
end;
procedure TestReconnectFromNameIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    CloseConnection(testConnection);
    CheckNetworkActivity();
    AssertFalse(IsConnectionOpen(testConnection));
    Reconnect('test_connection');
    CheckNetworkActivity();
    AssertTrue(IsConnectionOpen('test_connection'));
end;
procedure TestReleaseAllConnectionsIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection1', '127.0.0.1', 8080);
    CleanupConnection := TConnectionCleanup.Create;
    OpenConnection('test_connection2', '127.0.0.1', 8080);
    CheckNetworkActivity();
    AssertTrue(HasConnection('test_connection1'));
    AssertTrue(HasConnection('test_connection2'));
    ReleaseAllConnections();
    AssertFalse(HasConnection('test_connection1'));
    AssertFalse(HasConnection('test_connection2'));
    AssertFalse(HasServer('Test Server'));
end;
procedure TestResetNewConnectionCountIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertEquals(NewConnectionCount(testServer), 1);
    ResetNewConnectionCount(testServer);
    AssertEquals(0, NewConnectionCount(testServer));
end;
procedure TestRetrieveConnectionNamedIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    retrievedConnection := RetrieveConnection('test_connection', 0);
    AssertEquals(testConnection, retrievedConnection);
end;
procedure TestRetrieveConnectionIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    retrievedConnection := RetrieveConnection(testServer, 0);
    AssertEquals(testConnection, retrievedConnection);
end;
procedure TestSendMessageToConnectionIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    testConnection := OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    sendResult := SendMessageTo('Test Message', testConnection);
    CheckNetworkActivity();
    AssertTrue(sendResult);
end;
procedure TestSendMessageToNameIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    sendResult := SendMessageTo('Test Message', 'test_connection');
    CheckNetworkActivity();
    AssertTrue(sendResult);
end;
procedure TestServerHasNewConnectionNamedIntegration;
begin
    CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertTrue(ServerHasNewConnection('Test Server'));
end;
procedure TestServerHasNewConnectionIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    OpenConnection('test_connection', '127.0.0.1', 5000);
    CleanupConnection := TConnectionCleanup.Create;
    CheckNetworkActivity();
    AssertTrue(ServerHasNewConnection(testServer));
end;
procedure TestServerNamedIntegration;
begin
    testServer := CreateServer('Test Server', 5000);
    CleanupServer := TServerCleanup.Create;
    retrievedServer := ServerNamed('Test Server');
    AssertEquals(testServer, retrievedServer);
end;
procedure TestSetUDPPacketSizeIntegration;
begin
    SetUDPPacketSize(Cardinal(1024));
    AssertEquals(Cardinal(1024), UDPPacketSize());
end;
procedure TestUDPPacketSizeIntegration;
begin
    testPacketSize := UDPPacketSize();
    AssertTrue(testPacketSize > 0);
end;
procedure TestDownloadBitmapIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testBitmap := DownloadBitmap('test_image', 'http://localhost:8080/test/resources/images/frog.png', 80);
    AssertNotNull(testBitmap);
end;
procedure TestDownloadFontIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testFont := DownloadFont('test_font', 'http://localhost:8080/test/resources/fonts/hara.ttf', 80);
    AssertNotNull(testFont);
end;
procedure TestDownloadMusicIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testMusic := DownloadMusic('test_music', 'http://localhost:8080/test/resources/music/280.mp3', 80);
    AssertNotNull(testMusic);
end;
procedure TestDownloadSoundEffectIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testSoundEffect := DownloadSoundEffect('test_sound', 'http://localhost:8080/test/resources/sounds/breakdance.wav', 80);
    AssertNotNull(testSoundEffect);
end;
procedure TestFreeResponseIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertNotNull(testResponse);
    FreeResponse(testResponse);
    AssertNull(testResponse);
end;
procedure TestHttpGetIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertNotNull(testResponse);
    responseText := HttpResponseToString(testResponse);
    AssertTrue(Length(responseText) > 0);
    FreeResponse(testResponse);
end;
procedure TestHttpPostWithHeadersIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    headers := TArray<String>.Create('Content-Type: application/json', 'Accept: application/json');
    testResponse := HttpPost('http://localhost:8080/test', 80, 'Test Body', headers);
    AssertNotNull(testResponse);
    responseText := HttpResponseToString(testResponse);
    AssertTrue(Contains(responseText, 'Test Body'));
    FreeResponse(testResponse);
end;
procedure TestHttpPostIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testResponse := HttpPost('http://localhost:8080/test', 80, 'Test Body');
    AssertNotNull(testResponse);
    responseText := HttpResponseToString(testResponse);
    AssertTrue(Contains(responseText, 'Test Body'));
    FreeResponse(testResponse);
end;
procedure TestHttpResponseToStringIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testResponse := HttpGet('http://localhost:8080/test', 80);
    responseText := HttpResponseToString(testResponse);
    AssertTrue(Length(responseText) > 0);
    FreeResponse(testResponse);
end;
procedure TestSaveResponseToFileIntegration;
begin
    CreateServer('Test Server', 8080);
    CleanupServer := TServerCleanup.Create;
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testFile := 'test_output.txt';
    SaveResponseToFile(testResponse, testFile);
    FreeResponse(testResponse);
end;
procedure TestHasIncomingRequestsIntegration;
begin
    testServer := StartWebServer(8080);
    AssertFalse(HasIncomingRequests(testServer));
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertTrue(HasIncomingRequests(testServer));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestIsDeleteRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertTrue(HasIncomingRequests(testServer));
    testRequest := NextWebRequest(testServer);
    AssertFalse(IsDeleteRequestFor(testRequest, '/test'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestIsGetRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertTrue(HasIncomingRequests(testServer));
    testRequest := NextWebRequest(testServer);
    AssertTrue(IsGetRequestFor(testRequest, '/test'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestIsOptionsRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertTrue(HasIncomingRequests(testServer));
    testRequest := NextWebRequest(testServer);
    AssertFalse(IsOptionsRequestFor(testRequest, '/test'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestIsPostRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpPost('http://localhost:8080/test_path', 80, 'test=123');
    AssertTrue(HasIncomingRequests(testServer));
    testRequest := NextWebRequest(testServer);
    AssertTrue(IsPostRequestFor(testRequest, '/test_path'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestIsPutRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertTrue(HasIncomingRequests(testServer));
    testRequest := NextWebRequest(testServer);
    AssertFalse(IsPutRequestFor(testRequest, '/test'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestIsRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertTrue(HasIncomingRequests(testServer));
    testRequest := NextWebRequest(testServer);
    AssertTrue(IsRequestFor(testRequest, HttpMethod.HTTP_GET_METHOD, '/test'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestIsTraceRequestForIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertTrue(HasIncomingRequests(testServer));
    testRequest := NextWebRequest(testServer);
    AssertFalse(IsTraceRequestFor(testRequest, '/test'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestNextWebRequestIntegration;
begin
    testServer := StartWebServer(8080);
    AssertFalse(HasIncomingRequests(testServer));
    testRequest := NextWebRequest(testServer);
    AssertNull(testRequest);
    StopWebServer(testServer);
end;
procedure TestRequestBodyIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpPost('http://localhost:8080/test', 80, 'test body');
    testRequest := NextWebRequest(testServer);
    AssertEquals('test body', RequestBody(testRequest));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestRequestHasQueryParameterIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test?param1=value1', 80);
    testRequest := NextWebRequest(testServer);
    AssertTrue(RequestHasQueryParameter(testRequest, 'param1'));
    AssertFalse(RequestHasQueryParameter(testRequest, 'nonexistent_param'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestRequestHeadersIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    AssertTrue(Length(RequestHeaders(testRequest)) > 0);
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestRequestMethodIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    AssertEquals(HttpMethod.HTTP_GET_METHOD, RequestMethod(testRequest));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestRequestQueryParameterIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test?param1=value1', 80);
    testRequest := NextWebRequest(testServer);
    testResult := RequestQueryParameter(testRequest, 'param1', 'default_value');
    AssertEquals('value1', testResult);
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestRequestQueryStringIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test?param1=value1', 80);
    testRequest := NextWebRequest(testServer);
    testQueryString := RequestQueryString(testRequest);
    AssertEquals('param1=value1', testQueryString);
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestRequestURIIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    testURI := RequestURI(testRequest);
    AssertEquals('/test', testURI);
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestRequestURIStubsIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test/path', 80);
    testRequest := NextWebRequest(testServer);
    testStubs := RequestURIStubs(testRequest);
    AssertEquals(TArray<String>.Create('test', 'path'), testStubs);
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendCSSFileResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test.css', 80);
    testRequest := NextWebRequest(testServer);
    SendCSSFileResponse(testRequest, 'test.css');
    AssertTrue(IsRequestFor(testRequest, HttpMethod.HTTP_GET_METHOD, '/test.css'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendFileResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test.txt', 80);
    testRequest := NextWebRequest(testServer);
    SendFileResponse(testRequest, 'test.txt', 'text/plain');
    AssertTrue(IsRequestFor(testRequest, HttpMethod.HTTP_GET_METHOD, '/test.txt'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendHtmlFileResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test.html', 80);
    testRequest := NextWebRequest(testServer);
    SendHtmlFileResponse(testRequest, 'test.html');
    AssertTrue(IsRequestFor(testRequest, HttpMethod.HTTP_GET_METHOD, '/test.html'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendJavascriptFileResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test.js', 80);
    testRequest := NextWebRequest(testServer);
    SendJavascriptFileResponse(testRequest, 'test.js');
    AssertTrue(IsRequestFor(testRequest, HttpMethod.HTTP_GET_METHOD, '/test.js'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendResponseEmptyIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest);
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendResponseIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, 'Test Message');
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendResponseJsonWithStatusIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, HttpStatusCode.HTTP_STATUS_OK);
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendResponseWithStatusIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, HttpStatusCode.HTTP_STATUS_OK, 'Test Message');
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendResponseWithStatusAndContentTypeIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, HttpStatusCode.HTTP_STATUS_OK, 'Test Message', 'text/plain');
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendResponseWithStatusAndContentTypeAndHeadersIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    SendResponse(testRequest, HttpStatusCode.HTTP_STATUS_OK, 'Test Message', 'text/plain', TArray<String>.Create('Header1: Value1', 'Header2: Value2'));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSendResponseJsonIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    testRequest := NextWebRequest(testServer);
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetString(testJson, 'message', 'Test Message');
    SendResponse(testRequest, testJson);
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
procedure TestSplitURIStubsIntegration;
begin
    testStubs := SplitURIStubs('/names/0');
    AssertEquals(TArray<String>.Create('names', '0'), testStubs);
    testStubsEmpty := SplitURIStubs('/');
    AssertTrue(Length(testStubsEmpty) = 0);
end;
procedure TestStartWebServerWithDefaultPortIntegration;
begin
    testServer := StartWebServer();
    AssertNotNull(testServer);
    StopWebServer(testServer);
end;
procedure TestStartWebServerIntegration;
begin
    testServer := StartWebServer(8080);
    AssertNotNull(testServer);
    StopWebServer(testServer);
end;
procedure TestStopWebServerIntegration;
begin
    testServer := StartWebServer(8080);
    testResponse := HttpGet('http://localhost:8080/test', 80);
    AssertTrue(HasIncomingRequests(testServer));
    FreeResponse(testResponse);
    StopWebServer(testServer);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
