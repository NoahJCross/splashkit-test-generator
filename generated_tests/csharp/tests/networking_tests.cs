using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestNetworking
    {
        [Fact]
        public void TestAcceptAllNewConnectionsIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var connectionsAccepted = AcceptAllNewConnections();
            Assert.True(connectionsAccepted);
        }
        [Fact]
        public void TestAcceptNewConnectionIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var connectionAccepted = AcceptNewConnection(testServer);
            Assert.True(connectionAccepted);
        }
        [Fact]
        public void TestBroadcastMessageIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection1 = OpenConnection("test_connection1", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            var testConnection2 = OpenConnection("test_connection2", "127.0.0.1", 5000);
            CheckNetworkActivity();
            BroadcastMessage("Test Message", testServer);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection1));
            Assert.True(HasMessages(testConnection2));
        }
        [Fact]
        public void TestBroadcastMessageToAllIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection1 = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            var testConnection2 = OpenConnection("test_connection2", "127.0.0.1", 5000);
            CheckNetworkActivity();
            BroadcastMessage("Test Message");
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection1));
            Assert.True(HasMessages(testConnection2));
        }
        [Fact]
        public void TestBroadcastMessageToServerNamedIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            BroadcastMessage("Test Message", "Test Server");
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
        }
        [Fact]
        public void TestCheckNetworkActivityIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.True(HasNewConnections());
        }
        [Fact]
        public void TestClearMessagesFromNameIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            ClearMessages("test_connection");
            CheckNetworkActivity();
            Assert.False(HasMessages(testConnection));
        }
        [Fact]
        public void TestClearMessagesFromConnectionIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
            ClearMessages(testConnection);
            Assert.False(HasMessages(testConnection));
        }
        [Fact]
        public void TestClearMessagesFromServerIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testServer));
            ClearMessages(testServer);
            CheckNetworkActivity();
            Assert.False(HasMessages(testServer));
        }
        [Fact]
        public void TestCloseAllConnectionsIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.True(HasConnection("test_connection"));
            CloseAllConnections();
            CheckNetworkActivity();
            Assert.False(HasConnection("test_connection"));
        }
        [Fact]
        public void TestCloseAllServersIntegration() {
            CreateServer("Test Server 1", 5000);
            using var cleanupServer = new ServerCleanup();
            CreateServer("Test Server 2", 5001);
            Assert.True(HasServer("Test Server 1"));
            Assert.True(HasServer("Test Server 2"));
            CloseAllServers();
            Assert.False(HasServer("Test Server 1"));
            Assert.False(HasServer("Test Server 2"));
        }
        [Fact]
        public void TestCloseConnectionIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var closeResult = CloseConnection(testConnection);
            Assert.True(closeResult);
            Assert.False(IsConnectionOpen(testConnection));
        }
        [Fact]
        public void TestCloseConnectionNamedIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen(testConnection));
            var closeResult = CloseConnection("test_connection");
            Assert.True(closeResult);
            Assert.False(IsConnectionOpen(testConnection));
        }
        [Fact]
        public void TestCloseMessageIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages());
            var testMessage = ReadMessage();
            Assert.NotNull(testMessage);
            CloseMessage(testMessage);
            Assert.False(HasMessages());
        }
        [Fact]
        public void TestCloseServerNamedIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var closeResult = CloseServer("Test Server");
            Assert.True(closeResult);
            Assert.False(HasServer("Test Server"));
        }
        [Fact]
        public void TestCloseServerIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var closeResult = CloseServer(testServer);
            Assert.True(closeResult);
            Assert.False(HasServer("Test Server"));
        }
        [Fact]
        public void TestConnectionCountNamedIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.Equal(1u, ConnectionCount("Test Server"));
        }
        [Fact]
        public void TestConnectionCountIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.Equal(1u, ConnectionCount(testServer));
        }
        [Fact]
        public void TestConnectionIPIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var testIP = ConnectionIP(testConnection);
            Assert.Equal(2130706433u, testIP);
        }
        [Fact]
        public void TestConnectionIPFromNameIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 8080);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var testIP = ConnectionIP("test_connection");
            Assert.Equal(2130706433u, testIP);
        }
        [Fact]
        public void TestConnectionNamedIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var retrievedConnection = ConnectionNamed("test_connection");
            Assert.NotNull(retrievedConnection);
        }
        [Fact]
        public void TestConnectionPortIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var testPort = ConnectionPort(testConnection);
            Assert.Equal(5000, testPort);
        }
        [Fact]
        public void TestConnectionPortFromNameIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var testPort = ConnectionPort("test_connection");
            Assert.Equal(5000, testPort);
        }
        [Fact]
        public void TestCreateServerWithPortIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            Assert.NotNull(testServer);
            Assert.True(HasServer("Test Server"));
        }
        [Fact]
        public void TestCreateServerWithPortAndProtocolIntegration() {
            var testServer = CreateServer("Test Server", 5000, ConnectionType.TCP);
            using var cleanupServer = new ServerCleanup();
            Assert.NotNull(testServer);
            Assert.True(HasServer("Test Server"));
        }
        [Fact]
        public void TestDecToHexIntegration() {
            var testHexResult = DecToHex(2130706433u);
            Assert.Equal("0x7F000001", testHexResult);
        }
        [Fact]
        public void TestFetchNewConnectionIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var newConnection = FetchNewConnection(testServer);
            Assert.NotNull(newConnection);
        }
        [Fact]
        public void TestHasConnectionIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.True(HasConnection("test_connection"));
            CloseConnection(testConnection);
            Assert.False(HasConnection("test_connection"));
        }
        [Fact]
        public void TestHasMessagesIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.False(HasMessages());
            SendMessageTo("test_message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages());
        }
        [Fact]
        public void TestHasMessagesOnConnectionIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testConnection));
        }
        [Fact]
        public void TestHasMessagesOnNameIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages("Test Server"));
        }
        [Fact]
        public void TestHasMessagesOnServerIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(HasMessages(testServer));
        }
        [Fact]
        public void TestHasNewConnectionsIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.True(HasNewConnections());
        }
        [Fact]
        public void TestHasServerIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            Assert.True(HasServer("Test Server"));
            CloseServer(testServer);
            Assert.False(HasServer("Test Server"));
        }
        [Fact]
        public void TestHexStrToIpv4Integration() {
            var testIpv4 = HexStrToIpv4("0x7F000001");
            Assert.Equal("127.0.0.1", testIpv4);
            var testIpv4NoPrefix = HexStrToIpv4("7F000001");
            Assert.Equal("127.0.0.1", testIpv4NoPrefix);
        }
        [Fact]
        public void TestHexToDecStringIntegration() {
            var testResult = HexToDecString("7F");
            Assert.Equal("127", testResult);
            var testResultWithPrefix = HexToDecString("0x7F");
            Assert.Equal("127", testResultWithPrefix);
        }
        [Fact]
        public void TestIpv4ToDecIntegration() {
            var testResult1 = Ipv4ToDec("127.0.0.1");
            Assert.Equal(2130706433u, testResult1);
            var testResult2 = Ipv4ToDec("192.168.1.1");
            Assert.Equal(3232235777, testResult2);
        }
        [Fact]
        public void TestIpv4ToHexIntegration() {
            var testIpv4Hex = Ipv4ToHex("127.0.0.1");
            Assert.Equal("0x7F000001", testIpv4Hex);
        }
        [Fact]
        public void TestIpv4ToStrIntegration() {
            var testIPStr = Ipv4ToStr(2130706433u);
            Assert.Equal("127.0.0.1", testIPStr);
        }
        [Fact]
        public void TestIsConnectionOpenIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen(testConnection));
            CloseConnection(testConnection);
            Assert.False(IsConnectionOpen(testConnection));
        }
        [Fact]
        public void TestIsConnectionOpenFromNameIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen("test_connection"));
            CloseConnection(testConnection);
            Assert.False(IsConnectionOpen("test_connection"));
        }
        [Fact]
        public void TestLastConnectionNamedIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var testLastConnection = LastConnection("Test Server");
            Assert.Equal(testConnection, testLastConnection);
        }
        [Fact]
        public void TestLastConnectionIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var testLastConnection = LastConnection(testServer);
            Assert.Equal(testConnection, testLastConnection);
        }
        [Fact]
        public void TestMessageConnectionIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal(testConnection, MessageConnection(testMessage));
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestMessageCountOnServerIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal(1u, MessageCount(testServer));
        }
        [Fact]
        public void TestMessageCountOnConnectionIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(MessageCount(testConnection) > 0);
        }
        [Fact]
        public void TestMessageCountFromNameIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal(1u, MessageCount(testServer));
        }
        [Fact]
        public void TestMessageDataIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestMessageDataBytesIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            var testMessageBytes = MessageDataBytes(testMessage);
            Assert.NotEmpty(testMessageBytes);
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestMessageHostIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal("127.0.0.1", MessageHost(testMessage));
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestMessagePortIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal(5000, MessagePort(testMessage));
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestMessageProtocolIntegration() {
            var testServer = CreateServer("Test Server", 5000, ConnectionType.UDP);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000, ConnectionType.UDP);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testServer);
            Assert.Equal(ConnectionType.UDP, MessageProtocol(testMessage));
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestMyIPIntegration() {
            var testIP = MyIP();
            Assert.Equal("127.0.0.1", testIP);
        }
        [Fact]
        public void TestNameForConnectionIntegration() {
            var testConnectionName = NameForConnection("localhost", 8080u);
            Assert.Equal("localhost:8080", testConnectionName);
        }
        [Fact]
        public void TestNewConnectionCountIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.Equal(1, NewConnectionCount(testServer));
        }
        [Fact]
        public void TestOpenConnectionIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 8080);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.NotNull(testConnection);
            Assert.True(IsConnectionOpen(testConnection));
            CloseConnection(testConnection);
            Assert.False(IsConnectionOpen(testConnection));
        }
        [Fact]
        public void TestOpenConnectionWithProtocolIntegration() {
            CreateServer("Test Server", 5000, ConnectionType.TCP);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000, ConnectionType.TCP);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.NotNull(testConnection);
        }
        [Fact]
        public void TestReadMessageIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage();
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestReadMessageFromConnectionIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage(testConnection);
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestReadMessageFromNameIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            var testMessage = ReadMessage("Test Server");
            Assert.Equal("Test Message", MessageData(testMessage));
            CloseMessage(testMessage);
        }
        [Fact]
        public void TestReadMessageFromServerIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
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
        public void TestReadMessageDataFromNameIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal("Test Message", ReadMessageData("Test Server"));
        }
        [Fact]
        public void TestReadMessageDataFromConnectionIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal("Test Message", ReadMessageData(testConnection));
        }
        [Fact]
        public void TestReadMessageDataFromServerIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.Equal("Test Message", ReadMessageData(testServer));
        }
        [Fact]
        public void TestReconnectIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            CloseConnection(testConnection);
            CheckNetworkActivity();
            Assert.False(IsConnectionOpen(testConnection));
            Reconnect(testConnection);
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen(testConnection));
        }
        [Fact]
        public void TestReconnectFromNameIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            CloseConnection(testConnection);
            CheckNetworkActivity();
            Assert.False(IsConnectionOpen(testConnection));
            Reconnect("test_connection");
            CheckNetworkActivity();
            Assert.True(IsConnectionOpen("test_connection"));
        }
        [Fact]
        public void TestReleaseAllConnectionsIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection1", "127.0.0.1", 8080);
            using var cleanupConnection = new ConnectionCleanup();
            OpenConnection("test_connection2", "127.0.0.1", 8080);
            CheckNetworkActivity();
            Assert.True(HasConnection("test_connection1"));
            Assert.True(HasConnection("test_connection2"));
            ReleaseAllConnections();
            Assert.False(HasConnection("test_connection1"));
            Assert.False(HasConnection("test_connection2"));
            Assert.False(HasServer("Test Server"));
        }
        [Fact]
        public void TestResetNewConnectionCountIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.Equal(NewConnectionCount(testServer), 1);
            ResetNewConnectionCount(testServer);
            Assert.Equal(0, NewConnectionCount(testServer));
        }
        [Fact]
        public void TestRetrieveConnectionNamedIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var retrievedConnection = RetrieveConnection("test_connection", 0);
            Assert.Equal(testConnection, retrievedConnection);
        }
        [Fact]
        public void TestRetrieveConnectionIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var retrievedConnection = RetrieveConnection(testServer, 0);
            Assert.Equal(testConnection, retrievedConnection);
        }
        [Fact]
        public void TestSendMessageToConnectionIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var testConnection = OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var sendResult = SendMessageTo("Test Message", testConnection);
            CheckNetworkActivity();
            Assert.True(sendResult);
        }
        [Fact]
        public void TestSendMessageToNameIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            var sendResult = SendMessageTo("Test Message", "test_connection");
            CheckNetworkActivity();
            Assert.True(sendResult);
        }
        [Fact]
        public void TestServerHasNewConnectionNamedIntegration() {
            CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.True(ServerHasNewConnection("Test Server"));
        }
        [Fact]
        public void TestServerHasNewConnectionIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            OpenConnection("test_connection", "127.0.0.1", 5000);
            using var cleanupConnection = new ConnectionCleanup();
            CheckNetworkActivity();
            Assert.True(ServerHasNewConnection(testServer));
        }
        [Fact]
        public void TestServerNamedIntegration() {
            var testServer = CreateServer("Test Server", 5000);
            using var cleanupServer = new ServerCleanup();
            var retrievedServer = ServerNamed("Test Server");
            Assert.Equal(testServer, retrievedServer);
        }
        [Fact]
        public void TestSetUDPPacketSizeIntegration() {
            SetUDPPacketSize(1024u);
            Assert.Equal(1024u, UDPPacketSize());
        }
        [Fact]
        public void TestUDPPacketSizeIntegration() {
            var testPacketSize = UDPPacketSize();
            Assert.True(testPacketSize > 0);
        }
        [Fact]
        public void TestDownloadBitmapIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testBitmap = DownloadBitmap("test_image", "http://localhost:8080/test/resources/images/frog.png", 80);
            Assert.NotNull(testBitmap);
        }
        [Fact]
        public void TestDownloadFontIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testFont = DownloadFont("test_font", "http://localhost:8080/test/resources/fonts/hara.ttf", 80);
            Assert.NotNull(testFont);
        }
        [Fact]
        public void TestDownloadMusicIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testMusic = DownloadMusic("test_music", "http://localhost:8080/test/resources/music/280.mp3", 80);
            Assert.NotNull(testMusic);
        }
        [Fact]
        public void TestDownloadSoundEffectIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testSoundEffect = DownloadSoundEffect("test_sound", "http://localhost:8080/test/resources/sounds/breakdance.wav", 80);
            Assert.NotNull(testSoundEffect);
        }
        [Fact]
        public void TestFreeResponseIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.NotNull(testResponse);
            FreeResponse(testResponse);
            Assert.Null(testResponse);
        }
        [Fact]
        public void TestHttpGetIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.NotNull(testResponse);
            var responseText = HttpResponseToString(testResponse);
            Assert.NotEmpty(responseText);
            FreeResponse(testResponse);
        }
        [Fact]
        public void TestHttpPostWithHeadersIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var headers = new List<string> { "Content-Type: application/json", "Accept: application/json" };
            var testResponse = HttpPost("http://localhost:8080/test", 80, "Test Body", headers);
            Assert.NotNull(testResponse);
            var responseText = HttpResponseToString(testResponse);
            Assert.True(Contains(responseText, "Test Body"));
            FreeResponse(testResponse);
        }
        [Fact]
        public void TestHttpPostIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testResponse = HttpPost("http://localhost:8080/test", 80, "Test Body");
            Assert.NotNull(testResponse);
            var responseText = HttpResponseToString(testResponse);
            Assert.True(Contains(responseText, "Test Body"));
            FreeResponse(testResponse);
        }
        [Fact]
        public void TestHttpResponseToStringIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var responseText = HttpResponseToString(testResponse);
            Assert.NotEmpty(responseText);
            FreeResponse(testResponse);
        }
        [Fact]
        public void TestSaveResponseToFileIntegration() {
            CreateServer("Test Server", 8080);
            using var cleanupServer = new ServerCleanup();
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testFile = "test_output.txt";
            SaveResponseToFile(testResponse, testFile);
            FreeResponse(testResponse);
        }
        [Fact]
        public void TestHasIncomingRequestsIntegration() {
            var testServer = StartWebServer(8080);
            Assert.False(HasIncomingRequests(testServer));
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsDeleteRequestForIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.False(IsDeleteRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsGetRequestForIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.True(IsGetRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsOptionsRequestForIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.False(IsOptionsRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsPostRequestForIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpPost("http://localhost:8080/test_path", 80, "test=123");
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.True(IsPostRequestFor(testRequest, "/test_path"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsPutRequestForIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.False(IsPutRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsRequestForIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestIsTraceRequestForIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.False(IsTraceRequestFor(testRequest, "/test"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestNextWebRequestIntegration() {
            var testServer = StartWebServer(8080);
            Assert.False(HasIncomingRequests(testServer));
            var testRequest = NextWebRequest(testServer);
            Assert.Null(testRequest);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestBodyIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpPost("http://localhost:8080/test", 80, "test body");
            var testRequest = NextWebRequest(testServer);
            Assert.Equal("test body", RequestBody(testRequest));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestHasQueryParameterIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test?param1=value1", 80);
            var testRequest = NextWebRequest(testServer);
            Assert.True(RequestHasQueryParameter(testRequest, "param1"));
            Assert.False(RequestHasQueryParameter(testRequest, "nonexistent_param"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestHeadersIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            Assert.NotEmpty(RequestHeaders(testRequest));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestMethodIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            Assert.Equal(HttpMethod.HttpGetMethod, RequestMethod(testRequest));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestQueryParameterIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test?param1=value1", 80);
            var testRequest = NextWebRequest(testServer);
            var testResult = RequestQueryParameter(testRequest, "param1", "default_value");
            Assert.Equal("value1", testResult);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestQueryStringIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test?param1=value1", 80);
            var testRequest = NextWebRequest(testServer);
            var testQueryString = RequestQueryString(testRequest);
            Assert.Equal("param1=value1", testQueryString);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestURIIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            var testURI = RequestURI(testRequest);
            Assert.Equal("/test", testURI);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestRequestURIStubsIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test/path", 80);
            var testRequest = NextWebRequest(testServer);
            var testStubs = RequestURIStubs(testRequest);
            Assert.Equal(new List<string> { "test", "path" }, testStubs);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendCSSFileResponseIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test.css", 80);
            var testRequest = NextWebRequest(testServer);
            SendCSSFileResponse(testRequest, "test.css");
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test.css"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendFileResponseIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test.txt", 80);
            var testRequest = NextWebRequest(testServer);
            SendFileResponse(testRequest, "test.txt", "text/plain");
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test.txt"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendHtmlFileResponseIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test.html", 80);
            var testRequest = NextWebRequest(testServer);
            SendHtmlFileResponse(testRequest, "test.html");
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test.html"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendJavascriptFileResponseIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test.js", 80);
            var testRequest = NextWebRequest(testServer);
            SendJavascriptFileResponse(testRequest, "test.js");
            Assert.True(IsRequestFor(testRequest, HttpMethod.HttpGetMethod, "/test.js"));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseEmptyIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, "Test Message");
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseJsonWithStatusIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.HttpStatusOk);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseWithStatusIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.HttpStatusOk, "Test Message");
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseWithStatusAndContentTypeIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.HttpStatusOk, "Test Message", "text/plain");
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseWithStatusAndContentTypeAndHeadersIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            SendResponse(testRequest, HttpStatusCode.HttpStatusOk, "Test Message", "text/plain", new List<string> { "Header1: Value1", "Header2: Value2" });
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSendResponseJsonIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            var testRequest = NextWebRequest(testServer);
            var testJson = CreateJson();
            using var cleanupJson = new JsonCleanup();
            JsonSetString(testJson, "message", "Test Message");
            SendResponse(testRequest, testJson);
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestSplitURIStubsIntegration() {
            var testStubs = SplitURIStubs("/names/0");
            Assert.Equal(new List<string> { "names", "0" }, testStubs);
            var testStubsEmpty = SplitURIStubs("/");
            Assert.Empty(testStubsEmpty);
        }
        [Fact]
        public void TestStartWebServerWithDefaultPortIntegration() {
            var testServer = StartWebServer();
            Assert.NotNull(testServer);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestStartWebServerIntegration() {
            var testServer = StartWebServer(8080);
            Assert.NotNull(testServer);
            StopWebServer(testServer);
        }
        [Fact]
        public void TestStopWebServerIntegration() {
            var testServer = StartWebServer(8080);
            var testResponse = HttpGet("http://localhost:8080/test", 80);
            Assert.True(HasIncomingRequests(testServer));
            FreeResponse(testResponse);
            StopWebServer(testServer);
        }
    }
}
