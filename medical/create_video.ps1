[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null

# Create output directory
$videoDir = "c:\Users\MSI\Desktop\medical\assets\videos"
$imagesDir = "c:\Users\MSI\Desktop\medical\assets\temp_images"
New-Item -ItemType Directory -Path $imagesDir -Force | Out-Null

# Medical-themed colors
$frames = @(
    @{
        title = "Mohannad Medical Clinic"
        subtitle = "Professional Healthcare Services"
        color = [System.Drawing.Color]::FromArgb(102, 126, 234)
        emoji = "🏥"
    },
    @{
        title = "Welcome to our Clinic"
        subtitle = "Expert Doctors & Modern Facilities"
        color = [System.Drawing.Color]::FromArgb(118, 75, 162)
        emoji = "👨‍⚕️"
    },
    @{
        title = "24/7 Emergency Services"
        subtitle = "Always Ready to Help"
        color = [System.Drawing.Color]::FromArgb(108, 99, 255)
        emoji = "🚑"
    },
    @{
        title = "Expert Medical Team"
        subtitle = "Experienced Specialists"
        color = [System.Drawing.Color]::FromArgb(102, 126, 234)
        emoji = "👩‍⚕️"
    },
    @{
        title = "State-of-the-Art Equipment"
        subtitle = "Latest Medical Technology"
        color = [System.Drawing.Color]::FromArgb(118, 75, 162)
        emoji = "🔬"
    },
    @{
        title = "Patient Care First"
        subtitle = "Your Health is Our Priority"
        color = [System.Drawing.Color]::FromArgb(108, 99, 255)
        emoji = "❤️"
    },
    @{
        title = "Al-Moruj District, Riyadh"
        subtitle = "Call: +966 50 000 0000"
        color = [System.Drawing.Color]::FromArgb(102, 126, 234)
        emoji = "📍"
    }
)

Write-Host "Creating clinic video frames..."

# Create images for each frame
for ($i = 0; $i -lt $frames.Count; $i++) {
    $frame = $frames[$i]
    
    # Create bitmap
    $bitmap = New-Object System.Drawing.Bitmap(1280, 720)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    
    # Fill background with gradient
    $brush = New-Object System.Drawing.SolidBrush($frame.color)
    $graphics.FillRectangle($brush, 0, 0, 1280, 720)
    
    # Draw title
    $titleFont = New-Object System.Drawing.Font("Arial", 72, [System.Drawing.FontStyle]::Bold)
    $subtitleFont = New-Object System.Drawing.Font("Arial", 48, [System.Drawing.FontStyle]::Regular)
    $textBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    
    # Draw emoji
    $emojiFont = New-Object System.Drawing.Font("Segoe UI Emoji", 120)
    $graphics.DrawString($frame.emoji, $emojiFont, $textBrush, 540, 100)
    
    # Draw title
    $titleSize = $graphics.MeasureString($frame.title, $titleFont)
    $titleX = (1280 - $titleSize.Width) / 2
    $graphics.DrawString($frame.title, $titleFont, $textBrush, $titleX, 280)
    
    # Draw subtitle
    $subtitleSize = $graphics.MeasureString($frame.subtitle, $subtitleFont)
    $subtitleX = (1280 - $subtitleSize.Width) / 2
    $graphics.DrawString($frame.subtitle, $subtitleFont, $textBrush, $subtitleX, 450)
    
    # Save image
    $imagePath = "$imagesDir\frame_$($i.ToString('000')).png"
    $bitmap.Save($imagePath)
    $graphics.Dispose()
    $bitmap.Dispose()
    
    Write-Host "✅ Frame $($i+1)/7 created: $imagePath"
}

Write-Host "Frames created successfully!"
