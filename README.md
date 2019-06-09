Purpose
-----
It automates the process of energy calculation, currently tested to work with quantum espresso. After using makelat command copy psudopotentials, runstruct_qe and qe.param inside the folder generated. Then run `./genstruct.sh`. You can append it with `&` to run it in background. If running in cloud `nohup` can be used at the beginning to avoid program hault after logout from cloud.
