using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestHasGpioIntegration()
        {
            var testGpioCapability = HasGpio();
            Assert.True(testGpioCapability);
            var testGpioCapability = HasGpio();
            Assert.False(testGpioCapability);
        }
        [Fact]
        public void TestRaspiCleanupIntegration()
        {
            RaspiInit();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            RaspiWrite(Pins.Pin11, PinValues.GpioHigh);
            RaspiCleanup();
            Assert.Equal(PinModes.GpioInput, RaspiGetMode(Pins.Pin11));
            Assert.Equal(PinValues.GpioLow, RaspiRead(Pins.Pin11));
        }
        [Fact]
        public void TestRaspiGetModeIntegration()
        {
            RaspiInit();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            var testMode = RaspiGetMode(Pins.Pin11);
            Assert.Equal(PinModes.GpioOutput, testMode);
            RaspiCleanup();
        }
        [Fact]
        public void TestRaspiInitIntegration()
        {
            var hasGpioCapability = HasGpio();
if (hasGpioCapability == true) {
                RaspiInit();
                Assert.True(HasGpio());
                RaspiCleanup();
}
            else
            {
                Assert.False(HasGpio());
}
        }
        [Fact]
        public void TestRaspiReadIntegration()
        {
            RaspiInit();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            RaspiWrite(Pins.Pin11, PinValues.GpioHigh);
            var testReadValue = RaspiRead(Pins.Pin11);
            Assert.Equal(PinValues.GpioHigh, testReadValue);
            RaspiCleanup();
        }
        [Fact]
        public void TestRaspiSetModeIntegration()
        {
            RaspiInit();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            Assert.Equal(PinModes.GpioOutput, RaspiGetMode(Pins.Pin11));
            RaspiCleanup();
        }
        [Fact]
        public void TestRaspiSetPullUpDownIntegration()
        {
            RaspiInit();
            RaspiSetMode(Pins.Pin11, PinModes.GpioInput);
            RaspiSetPullUpDown(Pins.Pin11, PullUpDown.PudUp);
            var testPinValue = RaspiRead(Pins.Pin11);
            Assert.Equal(PinValues.GpioHigh, testPinValue);
            RaspiSetPullUpDown(Pins.Pin11, PullUpDown.PudDown);
            var testPinValue = RaspiRead(Pins.Pin11);
            Assert.Equal(PinValues.GpioLow, testPinValue);
            RaspiCleanup();
        }
        [Fact]
        public void TestRaspiSetPwmDutycycleIntegration()
        {
            RaspiInit();
            RaspiSetMode(Pins.Pin18, PinModes.PwmOutput);
            RaspiSetPwmDutycycle(Pins.Pin18, 50);
            RaspiCleanup();
        }
        [Fact]
        public void TestRaspiSetPwmFrequencyIntegration()
        {
            RaspiInit();
            RaspiSetMode(Pins.Pin18, PinModes.PwmOutput);
            RaspiSetPwmFrequency(Pins.Pin18, 1000);
            RaspiCleanup();
        }
        [Fact]
        public void TestRaspiSetPwmRangeIntegration()
        {
            RaspiInit();
            RaspiSetMode(Pins.Pin11, PinModes.GpioPwm);
            RaspiSetPwmRange(Pins.Pin11, 1024);
            RaspiSetPwmDutycycle(Pins.Pin11, 512);
            RaspiCleanup();
        }
        [Fact]
        public void TestRaspiWriteIntegration()
        {
            RaspiInit();
            RaspiSetMode(Pins.Pin11, PinModes.GpioOutput);
            RaspiWrite(Pins.Pin11, PinValues.GpioHigh);
            var testPinValue = RaspiRead(Pins.Pin11);
            Assert.Equal(PinValues.GpioHigh, testPinValue);
            RaspiCleanup();
        }
    }
}
