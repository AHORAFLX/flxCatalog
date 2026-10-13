using Microsoft.Extensions.Configuration;

namespace flxCatalog.InterfaceTest.Infrastructure;

public sealed record Credentials(string User, string Password);

/// <summary>
/// Reads appsettings.json, then appsettings.local.json (git-ignored, for the passwords), then
/// FLXTEST_-prefixed environment variables (e.g. FLXTEST_Cliente__Password) for CI.
/// </summary>
public sealed class TestSettings
{
    public required string Url { get; init; }
    public required string BackendUrl { get; init; }
    public required string Browser { get; init; }
    public bool Headless { get; init; }
    public float SlowMo { get; init; }
    public int TimeoutMs { get; init; }
    public required Credentials Admin { get; init; }
    public required Credentials Cliente { get; init; }

    private static readonly Lazy<TestSettings> _current = new(Load);
    public static TestSettings Current => _current.Value;

    private static TestSettings Load()
    {
        var config = new ConfigurationBuilder()
            .SetBasePath(AppContext.BaseDirectory)
            .AddJsonFile("appsettings.json", optional: false)
            .AddJsonFile("appsettings.local.json", optional: true)
            .AddEnvironmentVariables("FLXTEST_")
            .Build();

        Credentials Read(string section)
        {
            var user = config[$"{section}:User"];
            var pass = config[$"{section}:Password"];
            if (string.IsNullOrWhiteSpace(user) || string.IsNullOrWhiteSpace(pass))
                throw new InvalidOperationException(
                    $"Faltan las credenciales de '{section}'. Ponlas en appsettings.local.json " +
                    $"o en las variables FLXTEST_{section}__User / FLXTEST_{section}__Password.");
            return new Credentials(user, pass);
        }

        return new TestSettings
        {
            Url = (config["Url"] ?? "http://localhost:7111").TrimEnd('/'),
            BackendUrl = (config["BackendUrl"] ?? "http://localhost:7110").TrimEnd('/'),
            Browser = config["Browser"] ?? "chrome",
            Headless = bool.TryParse(config["Headless"], out var h) && h,
            SlowMo = float.TryParse(config["SlowMo"], out var s) ? s : 0,
            TimeoutMs = int.TryParse(config["TimeoutMs"], out var t) ? t : 15000,
            Admin = Read("Admin"),
            Cliente = Read("Cliente"),
        };
    }
}
