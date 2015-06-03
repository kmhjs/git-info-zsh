function git-commit-diff()
{
    local from_branch_name target_branch_name
    from_branch_name="${1}"
    target_branch_name="${2}"

    git rev-list ${from_branch_name}..${target_branch_name}
}

function git-commit-diff-current-master()
{
    git-commit-diff "develop" "$(git rev-parse --abbrev-ref HEAD)"
}

function git-commit-diff-current-master-count()
{
    git-commit-diff-current-master | wc -l
}
