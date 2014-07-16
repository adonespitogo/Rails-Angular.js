mod = angular.module 'HelperServices', []

mod.provider 'templates', ->
    {
      templatePath: (path) ->
                     @$get().templatePath(path)
      $get: ->
        {
          templatePath: (path) ->
                    #template root path
                    tmp_root = "apps/resto_admin/views/"
                    path = if path.charAt(0) == '/' then path.substring(1) else path
                    @path = tmp_root + path
        }

    }
