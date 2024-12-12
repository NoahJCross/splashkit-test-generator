using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestNetworking
    {
        [Fact]
        public void TestAcceptAllNewConnectionsIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var connectionsAccepted = AcceptAllNewConnections();
            Assert.True(connectionsAccepted);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestAcceptNewConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var connectionAccepted = AcceptNewConnection(testServer);
            Assert.True(connectionAccepted);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestBroadcastMessageIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection1 = OpenConnection("test_connection1", "127.0.0.1", 5000);
            var testConnection2 = OpenConnection("test_connection2", "127.0.0.1", 5000);
            CheckNetworkActivity();
            BroadcastMessage("Test Message", testServer);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection1));
            Assert.True(HasMessages(testConnection2));
            CloseAllConnections();
            CloseServer(testServer);
        }
        [Fact]
        public void TestBroadcastMessageToAllIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection1 = OpenConnection("test_connection", "127.0.0.1", 5000);
            var testConnection2 = OpenConnection("test_connection2", "127.0.0.1", 5000);
            CheckNetworkActivity();
            BroadcastMessage("Test Message");
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection1));
            Assert.True(HasMessages(testConnection2));
            CloseAllConnections();
            CloseServer(testServer);
        }
        [Fact]
        public void TestBroadcastMessageToServerNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            BroadcastMessage("Test Message", "test_server");
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestCheckNetworkActivityIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(HasNewConnections());
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestClearMessagesFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            ClearMessages("test_connection");
            CheckNetworkActivity();
            Assert.False(HasMessages(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestClearMessagesFromConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            ClearMessages(testConnection);
            Assert.False(HasMessages(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestClearMessagesFromServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testServer));
            ClearMessages(testServer);
            CheckNetworkActivity();
            Assert.False(HasMessages(testServer));
            CloseServer(testServer);
        }
        [Fact]
        public void TestCloseAllConnectionsIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(HasConnection("test_connection"));
            CloseAllConnections();
            CheckNetworkActivity();
            Assert.False(HasConnection("test_connection"));
            CloseServer(testServer);
        }
        [Fact]
        public void TestCloseAllServersIntegration()
        {
            var testServer1 = CreateServer("test_server_1", 5000);
            var testServer2 = CreateServer("test_server_2", 5001);
            Assert.True(HasServer("test_server_1"));
            Assert.True(HasServer("test_server_2"));
            CloseAllServers();
            Assert.False(HasServer("test_server_1"));
            Assert.False(HasServer("test_server_2"));
        }
        [Fact]
        public void TestCloseConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            CheckNetworkActivity();
            var closeResult = CloseConnection(testConnection);
            Assert.True(closeResult);
            Assert.False(IsConnectionOpen(testConnection));
            CloseServer(testServer);
        }
        [Fact]
        public void TestCloseConnectionNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen(testConnection));
            var closeResult = CloseConnection("test_connection");
            Assert.True(closeResult);
            Assert.False(IsConnectionOpen(testConnection));
            CloseServer(testServer);
        }
        [Fact]
        public void TestCloseMessageIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages());
            var testMessage = ReadMessage();
            Assert.NotNull(testMessage);
            CloseMessage(testMessage);
            Assert.False(HasMessages());
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestCloseServerNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var closeResult = CloseServer("test_server");
            Assert.True(closeResult);
            Assert.False(HasServer("test_server"));
        }
        [Fact]
        public void TestCloseServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var closeResult = CloseServer(testServer);
            Assert.True(closeResult);
            Assert.False(HasServer("test_server"));
        }
        [Fact]
        public void TestConnectionCountNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.Equal(1, ConnectionCount("test_server"));
            CloseAllConnections();
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionCountIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.Equal(1, ConnectionCount(testServer));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionIPIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var testIP = ConnectionIP(testConnection);
            Assert.Equal(2130706433, testIP);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionIPFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            CheckNetworkActivity();
            var testIP = ConnectionIP("test_connection");
            Assert.Equal(2130706433, testIP);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var retrievedConnection = ConnectionNamed("test_connection");
            Assert.NotNull(retrievedConnection);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionPortIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var testPort = ConnectionPort(testConnection);
            Assert.Equal(5000, testPort);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestConnectionPortFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var testPort = ConnectionPort("test_connection");
            Assert.Equal(5000, testPort);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestCreateServerWithPortIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            Assert.NotNull(testServer);
            Assert.True(HasServer("test_server"));
            CloseServer(testServer);
        }
        [Fact]
        public void TestCreateServerWithPortAndProtocolIntegration()
        {
            var testServer = CreateServer("test_server", 5000, ConnectionType.TCP);
            Assert.NotNull(testServer);
            Assert.True(HasServer("test_server"));
            CloseServer(testServer);
        }
        [Fact]
        public void TestDecToHexIntegration()
        {
            var testHexResult = DecToHex(2130706433);
            Assert.Equal("0x7F000001", testHexResult);
        }
        [Fact]
        public void TestFetchNewConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var newConnection = FetchNewConnection(testServer);
            Assert.NotNull(newConnection);
            CloseConnection(newConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            CheckNetworkActivity();
            Assert.True(HasConnection("test_connection"));
            CloseConnection(testConnection);
            Assert.False(HasConnection("test_connection"));
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasMessagesIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.False(HasMessages());
            SendMessageTo("test_message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages());
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasMessagesOnConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasMessagesOnNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages("test_server"));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasMessagesOnServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testServer));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasNewConnectionsIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(HasNewConnections());
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            Assert.True(HasServer("test_server"));
            CloseServer(testServer);
            Assert.False(HasServer("test_server"));
        }
        [Fact]
        public void TestHexStrToIpv4Integration()
        {
            var testIpv4 = HexStrToIpv4("0x7F000001");
            Assert.Equal("127.0.0.1", testIpv4);
            var testIpv4NoPrefix = HexStrToIpv4("7F000001");
            Assert.Equal("127.0.0.1", testIpv4NoPrefix);
        }
        [Fact]
        public void TestHexToDecStringIntegration()
        {
            var testResult = HexToDecString("7F");
            Assert.Equal("127", testResult);
            var testResultWithPrefix = HexToDecString("0x7F");
            Assert.Equal("127", testResultWithPrefix);
        }
        [Fact]
        public void TestIpv4ToDecIntegration()
        {
            var testResult1 = Ipv4ToDec("127.0.0.1");
            Assert.Equal(2130706433, testResult1);
            var testResult2 = Ipv4ToDec("192.168.1.1");
            Assert.Equal(3232235777, testResult2);
        }
        [Fact]
        public void TestIpv4ToHexIntegration()
        {
            var testIpv4Hex = Ipv4ToHex("127.0.0.1");
            Assert.Equal("0x7F000001", testIpv4Hex);
        }
        [Fact]
        public void TestIpv4ToStrIntegration()
        {
            var testIPStr = Ipv4ToStr(2130706433);
            Assert.Equal("127.0.0.1", testIPStr);
        }
        [Fact]
        public void TestIsConnectionOpenIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen(testConnection));
            CloseConnection(testConnection);
            Assert.False(IsConnectionOpen(testConnection));
            CloseServer(testServer);
        }
        [Fact]
        public void TestIsConnectionOpenFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen("test_connection"));
            CloseConnection(testConnection);
            Assert.False(IsConnectionOpen("test_connection"));
            CloseServer(testServer);
        }
        [Fact]
        public void TestLastConnectionNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var lastConnection = LastConnection("test_server");
            Assert.Equal(testConnection, lastConnection);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestLastConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var lastConnection = LastConnection(testServer);
            Assert.Equal(testConnection, lastConnection);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal(testConnection, MessageConnection(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageCountOnServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal(1, MessageCount(testServer));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageCountOnConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(MessageCount(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageCountFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal(1, MessageCount("test_server"));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageDataIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageDataBytesIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            var testMessageBytes = MessageDataBytes(testMessage);
            Assert.NotNull(testMessageBytes);
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageHostIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal("127.0.0.1", MessageHost(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessagePortIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal(5000, MessagePort(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMessageProtocolIntegration()
        {
            var testServer = CreateServer("test_server", 5000, ConnectionType.UDP);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000, ConnectionType.UDP);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal(ConnectionType.UDP, MessageProtocol(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestMyIPIntegration()
        {
            var testIP = MyIP();
            Assert.Equal("127.0.0.1", testIP);
        }
        [Fact]
        public void TestNameForConnectionIntegration()
        {
            var testConnectionName = NameForConnection("localhost", 8080);
            Assert.Equal("localhost:8080", testConnectionName);
        }
        [Fact]
        public void TestNewConnectionCountIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.Equal(1, NewConnectionCount(testServer));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestOpenConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            CheckNetworkActivity();
            Assert.NotNull(testConnection);
            Assert.True(IsConnectionOpen(testConnection));
            CloseConnection(testConnection);
            Assert.False(IsConnectionOpen(testConnection));
            CloseServer(testServer);
        }
        [Fact]
        public void TestOpenConnectionWithProtocolIntegration()
        {
            var testServer = CreateServer("test_server", 5000, ConnectionType.TCP);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000, ConnectionType.TCP);
            CheckNetworkActivity();
            Assert.NotNull(testConnection);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReadMessageIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage();
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReadMessageFromConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testConnection);
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReadMessageFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage("test_server");
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReadMessageFromServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseConnection(testConnection);
            CloseServer(testServer);
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestReadMessageDataFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal("Test Message", ReadMessageData("test_server"));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReadMessageDataFromConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal("Test Message", ReadMessageData(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReadMessageDataFromServerIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal("Test Message", ReadMessageData(testServer));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReconnectIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            CloseConnection(testConnection);
            CheckNetworkActivity();
            Assert.False(IsConnectionOpen(testConnection));
            Reconnect(testConnection);
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen(testConnection));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReconnectFromNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            CloseConnection(testConnection);
            CheckNetworkActivity();
            Assert.False(IsConnectionOpen(testConnection));
            Reconnect("test_connection");
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen("test_connection"));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestReleaseAllConnectionsIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testConnection1 = OpenConnection("test_connection1", "127.0.0.1", 8080);
            var testConnection2 = OpenConnection("test_connection2", "127.0.0.1", 8080);
            CheckNetworkActivity();
            Assert.True(HasConnection("test_connection1"));
            Assert.True(HasConnection("test_connection2"));
            ReleaseAllConnections();
            Assert.False(HasConnection("test_connection1"));
            Assert.False(HasConnection("test_connection2"));
            Assert.False(HasServer("test_server"));
        }
        [Fact]
        public void TestResetNewConnectionCountIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.Equal(NewConnectionCount(testServer), 1);
            ResetNewConnectionCount(testServer);
            Assert.Equal(0, NewConnectionCount(testServer));
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestRetrieveConnectionNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var retrievedConnection = RetrieveConnection("test_connection", 0);
            Assert.Equal(testConnection, retrievedConnection);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestRetrieveConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var retrievedConnection = RetrieveConnection(testServer, 0);
            Assert.Equal(testConnection, retrievedConnection);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestSendMessageToConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var sendResult = SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(sendResult);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestSendMessageToNameIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            var sendResult = SendMessageTo("Test Message", "test_connection");
            CheckNetworkActivity();
            Assert.True(sendResult);
            CloseConnection(testConnection);
            CloseServer(testServer);
        }
        [Fact]
        public void TestServerHasNewConnectionNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(ServerHasNewConnection("test_server"));
            CloseServer(testServer);
            CloseAllConnections();
        }
        [Fact]
        public void TestServerHasNewConnectionIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            OpenConnection("test_connection", "127.0.0.1", 5000);
            CheckNetworkActivity();
            Assert.True(ServerHasNewConnection(testServer));
            CloseServer(testServer);
            CloseAllConnections();
        }
        [Fact]
        public void TestServerNamedIntegration()
        {
            var testServer = CreateServer("test_server", 5000);
            var retrievedServer = ServerNamed("test_server");
            Assert.Equal(testServer, retrievedServer);
            CloseServer(testServer);
        }
        [Fact]
        public void TestSetUDPPacketSizeIntegration()
        {
            SetUDPPacketSize(1024);
            Assert.Equal(1024, UDPPacketSize());
        }
        [Fact]
        public void TestUDPPacketSizeIntegration()
        {
            var testPacketSize = UDPPacketSize();
            Assert.True(testPacketSize > 0);
        }
        [Fact]
        public void TestDownloadBitmapIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = DownloadBitmap("test_image", "http://localhost:8080/test/resources/images/frog.png", 80);
            Assert.NotNull(testBitmap);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
            CloseServer(testServer);
        }
        [Fact]
        public void TestDownloadFontIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testFont = DownloadFont("test_font", "http://localhost:8080/test/resources/fonts/hara.ttf", 80);
            Assert.NotNull(testFont);
            FreeFont(testFont);
            CloseServer(testServer);
        }
        [Fact]
        public void TestDownloadMusicIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testMusic = DownloadMusic("test_music", "http://localhost:8080/test/resources/music/280.mp3", 80);
            Assert.NotNull(testMusic);
            FreeMusic(testMusic);
            CloseServer(testServer);
        }
        [Fact]
        public void TestDownloadSoundEffectIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testSoundEffect = DownloadSoundEffect("test_sound", "http://localhost:8080/test/resources/sounds/breakdance.wav", 80);
            Assert.NotNull(testSoundEffect);
            FreeSoundEffect(testSoundEffect);
            CloseServer(testServer);
        }
        [Fact]
        public void TestFreeResponseIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.NotNull(testResponse);
            FreeResponse(testResponse);
            Assert.Equal("IntPtr.Zero", testResponse);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHttpGetIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.NotNull(testResponse);
            var responseText = HttpResponseToString(testResponse);
            Assert.NotEmpty(responseText);
            FreeResponse(testResponse);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHttpPostWithHeadersIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var headers = new List<string> { "Content-Type: application/json", "Accept: application/json" };
            var testResponse = HttpPost("http://localhost:8080/test", 80, "Test Body", headers);
            Assert.NotNull(testResponse);
            var responseText = HttpResponseToString(testResponse);
            Assert.Contains("Test Body", responseText);
            FreeResponse(testResponse);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHttpPostIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testResponse = HttpPost("http://localhost:8080/test", 80, "Test Body");
            Assert.NotNull(testResponse);
            var responseText = HttpResponseToString(testResponse);
            Assert.Contains("Test Body", responseText);
            FreeResponse(testResponse);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHttpResponseToStringIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var responseText = HttpResponseToString(testResponse);
            Assert.NotEmpty(responseText);
            FreeResponse(testResponse);
            CloseServer(testServer);
        }
        [Fact]
        public void TestSaveResponseToFileIntegration()
        {
            var testServer = CreateServer("test_server", 8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testFile = "test_output.txt";
            SaveResponseToFile(testResponse, testFile);
            FreeResponse(testResponse);
            CloseServer(testServer);
        }
        [Fact]
        public void TestHasIncomingRequestsIntegration()
        {
            var testServer = StartWebServer(8080);
            Assert.False(HasIncomingRequests(testServer));
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsDeleteRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.False(IsDeleteRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsGetRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.True(IsGetRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsOptionsRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.False(IsOptionsRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsPostRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpPost("http://localhost:8080/test_path", 80, "test=123");
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.True(IsPostRequestFor(testRequest, "/test_path"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsPutRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.False(IsPutRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsTraceRequestForIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.False(IsTraceRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestNextWebRequestIntegration()
        {
            var testServer = StartWebServer(8080);
            Assert.False(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.Null(testRequest);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestBodyIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpPost("http://localhost:8080/test", 80, "test body");
            var testRequest = NextWebRequest(testServer);
            Assert.Equal("test body", RequestBody(testRequest));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestHasQueryParameterIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test?param1=value1", 80);
            var testRequest = NextWebRequest(testServer);
            Assert.True(RequestHasQueryParameter(testRequest, "param1"));
            Assert.False(RequestHasQueryParameter(testRequest, "nonexistent_param"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestHeadersIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            Assert.NotEmpty(RequestHeaders(testRequest));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestMethodIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            Assert.Equal(HttpMethod.HttpGetMethod, RequestMethod(testRequest));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestQueryParameterIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test?param1=value1", 80);
            var testRequest = NextWebRequest(testServer);
            var testResult = RequestQueryParameter(testRequest, "param1", "default_value");
            Assert.Equal("value1", testResult);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestQueryStringIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test?param1=value1", 80);
            var testRequest = NextWebRequest(testServer);
            var testQueryString = RequestQueryString(testRequest);
            Assert.Equal("param1=value1", testQueryString);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestURIIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            var testURI = RequestURI(testRequest);
            Assert.Equal("/test", testURI);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestURIStubsIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test/path", 80);
            var testRequest = NextWebRequest(testServer);
            var testStubs = RequestURIStubs(testRequest);
            Assert.Equal(new List<string> { "test", "path" }, testStubs);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendCSSFileResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test.css", 80);
            var testRequest = NextWebRequest(testServer);
            SendCSSFileResponse(testRequest, "test.css");
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test.css"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendFileResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test.txt", 80);
            var testRequest = NextWebRequest(testServer);
            SendFileResponse(testRequest, "test.txt", "text/plain");
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test.txt"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendHtmlFileResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test.html", 80);
            var testRequest = NextWebRequest(testServer);
            SendHtmlFileResponse(testRequest, "test.html");
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test.html"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendJavascriptFileResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test.js", 80);
            var testRequest = NextWebRequest(testServer);
            SendJavascriptFileResponse(testRequest, "test.js");
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test.js"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseEmptyIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, "Test Message");
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseJsonWithStatusIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.HttpStatusOk);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseWithStatusIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.HttpStatusOk, "Test Message");
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseWithStatusAndContentTypeIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.HttpStatusOk, "Test Message", "text/plain");
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseWithStatusAndContentTypeAndHeadersIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.HttpStatusOk, "Test Message", "text/plain", new List<string> { "Header1: Value1", "Header2: Value2" });
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseJsonIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            var testJson = CreateJson();
            JsonSetString(testJson, "message", "Test Message");
            SendResponse(testRequest, testJson);
            FreeResponse(testResponse);
            FreeJson(testJson);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSplitURIStubsIntegration()
        {
            var testStubs = SplitURIStubs("/names/0");
            Assert.Equal(new List<dynamic> { "names", "0" }, testStubs);
            var testStubsEmpty = SplitURIStubs("/");
            Assert.Empty(testStubsEmpty);
        }
        [Fact]
        public void TestStartWebServerWithDefaultPortIntegration()
        {
            var testServer = StartWebServer();
            Assert.NotNull(testServer);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestStartWebServerIntegration()
        {
            var testServer = StartWebServer(8080);
            Assert.NotEqual("testServer", {:value_type=>"pointer_zero"});
            StopWebServer(testServer);
        }
        [Fact]
        public void TestStopWebServerIntegration()
        {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
    }
}
