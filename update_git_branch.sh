#!/bin/bash

# Define the next version
next_version="test123"

# Define the repository URL
#!/bin/bash

# Define the list of repository URLs
repository_urls=(
  "https://github.com/moulalis/odh-manifests.git"
  "https://github.com/moulalis/odh-dashboard.git"
  "https://github.com/moulalis/kubeflow.git"
  "https://github.com/moulalis/modelmesh-serving.git"
)

# Define the branch name you want to create
new_branch_name="$next_version"

# Loop through each repository URL and create a branch
for repo_url in "${repository_urls[@]}"; do
  # Extract the repository name from the URL
  repo_name=$(basename "$repo_url" .git)

  # Clone the repository (if not already cloned)
  if [ ! -d "$repo_name" ]; then
    git clone "$repo_url"
  fi

  # Change to the repository directory
  cd "$repo_name"

  # Create a new branch
  git checkout -b "$new_branch_name"

  # Push the new branch to the remote repository
  git push origin "$new_branch_name"

  # Provide a message indicating that the branch has been created
  echo "Branch '$new_branch_name' has been created and pushed to $repo_url."

  # Return to the script's directory
  cd ..
  rm -rf "$repo_name"
done
