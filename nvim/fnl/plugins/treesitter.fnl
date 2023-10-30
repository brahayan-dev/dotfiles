[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn []
            (let [treesitter (require :nvim-treesitter.configs)]
              (treesitter.setup {:highlight {:enable true}
                                 :indent {:enable true}
                                 :ensure_installed [:lua
						    :bash
                                                    :html
                                                    :java
                                                    :json
                                                    :yaml
                                                    :fennel
                                                    :clojure
                                                    :markdown
                                                    :dockerfile
                                                    :javascript]})))}]
