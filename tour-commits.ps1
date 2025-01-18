# -----------------------------
# Config
# -----------------------------
$repoPath = "D:\office\test\AppData"
$startDate = Get-Date "2025-01-19"
$endDate = Get-Date "2025-01-24"

# Standard commit messages for Tour Management System
$commitMessages = @(
    "Add user registration feature",
    "Implement tour booking API",
    "Fix bug in payment gateway integration",
    "Update tour details page UI",
    "Add email notification for bookings",
    "Refactor itinerary module",
    "Improve search filter for tours",
    "Add review and rating system",
    "Fix date validation for bookings",
    "Update database schema for destinations",
    "Add admin panel for tour management",
    "Optimize image upload for tour galleries",
    "Add authentication middleware",
    "Fix layout issue on homepage",
    "Update dependencies and packages"
)

# -----------------------------
# Go to repo folder
# -----------------------------
cd $repoPath

# Check if .git exists
if (-not (Test-Path ".git")) {
    Write-Host "Initializing git repository..."
    git init
    # Optional: set remote if not set
    # git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
}

# -----------------------------
# Loop through each day
# -----------------------------
for ($date = $startDate; $date -le $endDate; $date = $date.AddDays(1)) {

    # Random number of commits per day (1-6)
    $numCommits = Get-Random -Minimum 1 -Maximum 7

    for ($i = 1; $i -le $numCommits; $i++) {

        # Make a dummy change
        Add-Content .\dummy.txt "Update on $($date.ToString('yyyy-MM-dd')) commit $i"

        # Stage changes
        git add .

        # Random time for the commit
        $hour = Get-Random -Minimum 0 -Maximum 23
        $minute = Get-Random -Minimum 0 -Maximum 59
        $second = Get-Random -Minimum 0 -Maximum 59
        $commitDate = Get-Date -Year $date.Year -Month $date.Month -Day $date.Day -Hour $hour -Minute $minute -Second $second

        # Pick a random commit message
        $message = Get-Random -InputObject $commitMessages

        # Commit with date
        git commit -m "$message" --date="$($commitDate.ToString("yyyy-MM-dd HH:mm:ss"))"

        # Push immediately
        git push origin main
        Write-Host "Pushed commit: $message on $($commitDate.ToString('yyyy-MM-dd HH:mm:ss'))"
    }
}

Write-Host "All commits pushed successfully!"
