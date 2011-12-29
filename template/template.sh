#!/bin/bash

###
###| ここに説明を入れます。
###|   1. ここにStep1の説明
###|   2. ここにStep2の説明
### 
### @created   <?php echo date('Y/m/d'); ?>

### @copyright Copyright (c) ryo hongo All Rights Reserved.
###


### Prepare.
# Include Utility. You can use the snippet. Input "sn_".
. ~/scripts/utils.sh

# Show description of this. (###|)
Utils_Description $0

# Execute?
Utils_YesNo "Execute?"
if [ $? -eq 1 ]; then
    exit 0
fi


### Execute.

# Step:1

# Step:2


### Complete
Utils_Echo_Complete
