#!/bin/bash
set -e

ROTATE_DEGREES=90

# 1. Rotate pixels physically
sips -r $ROTATE_DEGREES ../assets/us/us.jpeg --out ../assets/us/tmp-rotated.jpg

# 2. Resize keeping original aspect ratio intact (-Z scales longest edge)
sips -Z 400  ../assets/us/tmp-rotated.jpg --out ../assets/us/tmp-small.jpg
sips -Z 800  ../assets/us/tmp-rotated.jpg --out ../assets/us/tmp-medium.jpg
sips -Z 2000 ../assets/us/tmp-rotated.jpg --out ../assets/us/tmp-large.jpg

# 3. Convert to WebP
cwebp -q 75 -m 6 -af ../assets/us/tmp-small.jpg  -o ../assets/us/us-small.webp
cwebp -q 75 -m 6 -af ../assets/us/tmp-medium.jpg -o ../assets/us/us-medium.webp
cwebp -q 75 -m 6 -af ../assets/us/tmp-large.jpg  -o ../assets/us/us-large.webp

# 4. Cleanup
rm ../assets/us/tmp-*.jpg

echo "Successfully generated 1500x2000 WebP image!"