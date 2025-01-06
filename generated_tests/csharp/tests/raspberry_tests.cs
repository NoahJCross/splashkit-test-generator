using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestRaspberry
    {
        [Fact]
        public void TestHasGpioIntegration() {
            var testGpioCapability = HasGpio();
            Assert.True(testGpioCapability);
        }
        [Fact]
        public void TestRaspiCleanupIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            RaspiWrite(Pins.Pin11, PinValues.GpioHigh);
            RaspiCleanup();
            RaspiInit();
            Assert.Equal(PinModes.GpioInput, RaspiGetMode(Pins.Pin11));
            Assert.Equal(PinValues.GpioLow, RaspiRead(Pins.Pin11));
        }
        [Fact]
        public void TestRaspiGetModeIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            var testMode = RaspiGetMode(Pins.Pin11);
            Assert.Equal(PinModes.GpioOutput, testMode);
        }
        [Fact]
        public void TestRaspiInitIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            Assert.True(HasGpio());
        }
        [Fact]
        public void TestRaspiReadIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            RaspiWrite(Pins.Pin11, PinValues.GpioHigh);
            var testReadValue = RaspiRead(Pins.Pin11);
            Assert.Equal(PinValues.GpioHigh, testReadValue);
        }
        [Fact]
        public void TestRaspiSetModeIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            Assert.Equal(PinModes.GpioOutput, RaspiGetMode(Pins.Pin11));
        }
        [Fact]
        public void TestRaspiSetPullUpDownIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            RaspiSetMode(Pins.Pin11, PinModes.GpioInput);
            RaspiSetPullUpDown(Pins.Pin11, PullUpDown.PudUp);
            var testPinValueUp = RaspiRead(Pins.Pin11);
            Assert.Equal(PinValues.GpioHigh, testPinValueUp);
            RaspiSetPullUpDown(Pins.Pin11, PullUpDown.PudDown);
            var testPinValueDown = RaspiRead(Pins.Pin11);
            Assert.Equal(PinValues.GpioLow, testPinValueDown);
        }
        [Fact]
        public void TestRaspiSetPwmDutycycleIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            RaspiSetMode(Pins.Pin18, PinModes.GpioOutput);
            RaspiSetPwmDutycycle(Pins.Pin18, 50);
            var mode = RaspiGetMode(Pins.Pin18);
            Assert.Equal(PinModes.GpioOutput, mode);
        }
        [Fact]
        public void TestRaspiSetPwmFrequencyIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            RaspiSetMode(Pins.Pin18, PinModes.GpioPwm);
            RaspiSetPwmFrequency(Pins.Pin18, 1000);
            var mode = RaspiGetMode(Pins.Pin18);
            Assert.Equal(PinModes.GpioPwm, mode);
        }
        [Fact]
        public void TestRaspiSetPwmRangeIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            RaspiSetPwmRange(Pins.Pin11, 1024);
            RaspiSetPwmDutycycle(Pins.Pin11, 512);
            var mode = RaspiGetMode(Pins.Pin11);
            Assert.Equal(PinModes.GpioOutput, mode);
        }
        [Fact]
        public void TestRaspiWriteIntegration() {
            RaspiInit();
            using var cleanupRaspi = new RaspiCleanup();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            RaspiWrite(Pins.Pin11, PinValues.GpioHigh);
            var testPinValue = RaspiRead(Pins.Pin11);
            Assert.Equal(PinValues.GpioHigh, testPinValue);
        }
    }
}
