function gcreate () {
  PROJECT_PATH=${pwd}
  USERNAME="seanho96"
  VISIBILITY="--public"

  while [ True ]; do  
    if [ "$1" = "--private" ]; then
      VISIBILITY="--private"
      shift 1
    else
      break
    fi
  done

  # step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
  echo "What name do you want to give your remote repo?"
  read REPO_NAME

  # step 2: enter a description of the repo
  echo "Enter a repo description: "
  read DESCRIPTION

  # step 3 : go to path, make a new directory, and enter it
  cd "$PROJECT_PATH"
  mkdir "$REPO_NAME"
  cd "$REPO_NAME"

  # step 4: initialise the repo locally, create blank README, add and commit
  git init
  touch README.MD
  git add README.MD
  git commit -m 'initial commit -setup with .sh script'

  # step 5 use github CLI to create your new repo
  gh repo create ${REPO_NAME} --description "${DESCRIPTION}" ${VISIBILITY}

  #  step 6 add the remote github repo to local repo and push
  git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git
  git push --set-upstream origin master

  echo "Done. Go to https://github.com/$USERNAME/$REPO_NAME to see." 
  echo " *** You're now in your project root. ***"
}
