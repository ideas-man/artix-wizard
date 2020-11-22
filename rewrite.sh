git filter-branch --commit-filter '

    # check to see if the committer (email is the desired one)
    if [ "$GIT_COMMITTER_EMAIL" = "specimen.commits@protonmail.com" ];
    then
            # Set the new desired name
            GIT_COMMITTER_NAME="ideas-man";
            GIT_AUTHOR_NAME="ideas-man";

            # Set the new desired email
            GIT_COMMITTER_EMAIL="ideasman.git@protonmail.com";
            GIT_AUTHOR_EMAIL="ideasman.git@protonmail.com";

            # (re) commit with the updated information
            git commit-tree "$@";
    else
            # No need to update so commit as is
            git commit-tree "$@";
    fi' 
HEAD
