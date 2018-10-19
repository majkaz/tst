#!/bin/bash

# quote input arguments

{
    printf "#!/bin/bash\n\n"
    printf "echo "
    for arg; do
        printf '%q ' "$arg"
    done

    printf "\n"
}  > s2

chmod u+x s2

# Open the newly created script with nano
nano -l +3 s2

