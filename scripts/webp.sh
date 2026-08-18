#!/bin/bash

# Change 90 to 270 if it rotates the wrong way
ROTATE_DEGREES=90

# 1. Rotate pixels physically and strip EXIF metadata
sips -r $ROTATE_DEGREES ../assets/us/us.jpeg --out ../assets/us/tmp-rotated.jpg
sips --deleteProperty orientation ../assets/us/tmp-rotated.jpg

# 2. Resize the upright image
sips -Z 600 ../assets/us/tmp-rotated.jpg --out ../assets/us/tmp-small.jpg
sips -Z 1200 ../assets/us/tmp-rotated.jpg --out ../assets/us/tmp-medium.jpg
sips -Z 2000 ../assets/us/tmp-rotated.jpg --out ../assets/us/tmp-large.jpg

# 3. Convert to WebP
cwebp -q 80 ../assets/us/tmp-small.jpg -o ../assets/us/us-small.webp
cwebp -q 80 ../assets/us/tmp-medium.jpg -o ../assets/us/us-medium.webp
cwebp -q 80 ../assets/us/tmp-large.jpg -o ../assets/us/us-large.webp

# 4. Cleanup
rm ../assets/us/tmp-*.jpg

echo "Done!"