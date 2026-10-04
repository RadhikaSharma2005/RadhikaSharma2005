# Adds descriptions, topics and homepage links to your public repos so the
# repo list and pinned cards stop showing "No description".
#
# Dry run (default, changes nothing):   .\scripts\update-repo-metadata.ps1
# Apply:                                 $env:GITHUB_TOKEN = "<token>"; .\scripts\update-repo-metadata.ps1 -Apply
#
# Token: GitHub -> Settings -> Developer settings -> Fine-grained tokens,
# repository access "All repositories", permission "Administration: Read and write".

param([switch]$Apply)

$owner = "RadhikaSharma2005"

$repos = @(
    @{
        name        = "CinePass-Ticket-booking-System"
        description = "Movie ticket booking with concurrency-safe seat holds, Razorpay payments, idempotency keys and a concurrency test suite. Node.js + PostgreSQL."
        homepage    = "https://cinepass-ticket-booking-system.onrender.com/"
        topics      = @("nodejs", "express", "postgresql", "razorpay", "concurrency", "booking-system", "rest-api", "react")
    },
    @{
        name        = "SnapCab"
        description = "Real-time ride-hailing app: Socket.IO ride matching to nearby drivers, maps, Razorpay payments. MERN stack."
        homepage    = ""
        topics      = @("mern", "socket-io", "react", "nodejs", "mongodb", "razorpay", "ride-sharing")
    },
    @{
        name        = "faq-backend"
        description = "FAQ management REST API built with Node.js and Express."
        homepage    = ""
        topics      = @("nodejs", "express", "rest-api")
    },
    @{
        name        = "E-commerce"
        description = "E-commerce mini project."
        homepage    = ""
        topics      = @("javascript", "ecommerce")
    }
)

$headers = @{
    Accept                 = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}
if ($Apply) {
    if (-not $env:GITHUB_TOKEN) { throw "Set `$env:GITHUB_TOKEN first." }
    $headers.Authorization = "Bearer $env:GITHUB_TOKEN"
}

foreach ($r in $repos) {
    $url = "https://api.github.com/repos/$owner/$($r.name)"
    if (-not $Apply) {
        Write-Host "[dry run] $($r.name)" -ForegroundColor Cyan
        Write-Host "  description: $($r.description)"
        if ($r.homepage) { Write-Host "  homepage:    $($r.homepage)" }
        Write-Host "  topics:      $($r.topics -join ', ')"
        continue
    }

    $body = @{ description = $r.description; homepage = $r.homepage } | ConvertTo-Json
    Invoke-RestMethod -Method Patch -Uri $url -Headers $headers -Body $body -ContentType "application/json" | Out-Null

    $topicsBody = @{ names = $r.topics } | ConvertTo-Json
    Invoke-RestMethod -Method Put -Uri "$url/topics" -Headers $headers -Body $topicsBody -ContentType "application/json" | Out-Null

    Write-Host "Updated $($r.name)" -ForegroundColor Green
}

if (-not $Apply) { Write-Host "`nNothing changed. Re-run with -Apply to update GitHub." -ForegroundColor Yellow }
