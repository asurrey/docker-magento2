#!/bin/bash

################################################################################
# Output the PHP version running in the image
################################################################################
echo ""
echo "Image PHP Version:"
echo ""

docker run -h test.host $IMAGE_NAME php --version || exit 1

################################################################################
# Run PHP requirements test
################################################################################
echo ""
echo "Running PHP requirements test:"
echo ""

docker run -h test.host --volume tests/php:/test $IMAGE_NAME php /test/test-requirements.php  | tee /tmp/test.log
grep "$TEST_OK_STRING" /tmp/test.log > /dev/null || exit 1
rm -f /tmp/test.log
