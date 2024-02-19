echo "  $(free --mega | grep Mem | awk '{print $3 "/" $2 "MB"}')" 
