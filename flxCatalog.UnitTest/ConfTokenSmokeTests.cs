using FLEXYGO.Configuration.Tokens;
using FLEXYGO.Web;

namespace flxCatalog.UnitTest
{
    [Collection("Flexygo Test Collection")]
    public class ConfTokenSmokeTests
    {
            public readonly ConfToken _conftoken;

            public ConfTokenSmokeTests()
            {
                _conftoken = GlobalVars.ConfToken;

            }

            [Fact]
            public void ConfToken_EstaDisponible_Y_TieneComponentesBasicos()
            {
                var ct = _conftoken;

                Assert.NotNull(ct);
                Assert.NotNull(ct.UserSecurity);
                Assert.NotNull(ct.ObjectsConfiguration);
                Assert.NotNull(GlobalVars.ConfToken);
                Assert.Equal("admin", ct.UserSecurity.UserName);
            }
        }
    
}
