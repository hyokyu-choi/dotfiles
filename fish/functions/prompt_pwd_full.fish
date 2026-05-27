    set -l args_pre
    set args_pre $args_pre -e 's|^/private/|/|'

    function prompt_pwd_full -V args_pre
      set -q fish_prompt_pwd_dir_length; or set -l fish_prompt_pwd_dir_length 1

      if [ $fish_prompt_pwd_dir_length -eq 0 ]
        set -l fish_prompt_pwd_dir_length 99999
      end

      set -l realhome ~
      echo $PWD | sed -e "s|^$realhome|~|" $args_pre -e 's-\([^/.]{'"$fish_prompt_pwd_dir_length"'}\)[^/]*/-\1/-g'
    end
