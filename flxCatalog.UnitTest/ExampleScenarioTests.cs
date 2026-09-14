using FLEXYGO.Objects;
using FLEXYGO.Web;

namespace flxCatalog.UnitTest
{
    [Collection("Flexygo Test Collection")]
    public class ExampleScenarioTests
    {

        [Fact(DisplayName = "Given a ConfToken When loading standard object Then can view?")]
        public void GivenConfToken_WhenLoadStandardObject_ThenCanView()
        {
            // Given
            var ct = GlobalVars.ConfToken;

            // When
            var obj = new EntityObject("sysJob", "JobName='UpdateNoticeBadge'", ct);

            // Then
            Assert.True(obj.CanView);
            Assert.Equal("sysJob", obj.Name);
        }
    }
}
