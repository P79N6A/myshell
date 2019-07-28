#!/usr/bin/env bash



branch=master
originBranch=master
comment="new commit" # 不建议

push=1
commit=1
pull=0
rebase=0

while getopts bcm:rpRoh opt; do
    case ${opt} in
    b)
        branch=$OPTARG
    ;;
    o)
        originBranch=$OPTARG
    ;;
    R)
        rebase=1
    ;;
    c)
        commit=0
    ;;
    m)
        commit=1
        comment=$OPTARG
    ;;
    p)
        push=1
    ;;
    r)
        push=0
    ;;
    h)
        echo "\tb\t本地分支\t"
        echo "\to\t远程分支\t"
        echo "\tR\t先rebase\t"
        echo "\tc\t使用上一次提交的commit\t"
        echo "\tm\t直接提交\t"
        echo "\tp\tpush到远程分支\t"
        echo "\tr\trvm到版本库\t"
        exit
    ;;
    *)
        echo "出现问题，检查是否冲突"
    ;;
    esac
done

git add .

if [[ ${rebase} -eq 1 ]]; then
    git stash
    git pull -r origin ${branch}
    git stash pop
fi

if [[ ${commit} -eq 1 ]]; then
    git commit -m ${comment}
else
    git cin
fi

if [[ ${push} -eq 1 ]]; then
    git push origin ${originBranch}
elif [[ push -eq 0 ]]; then
   read -p "请确定是否提交 y or n:" -n 1 sure
   if [[ ${sure} = y ]]; then
      git rvm r=xiayubing
   fi
fi