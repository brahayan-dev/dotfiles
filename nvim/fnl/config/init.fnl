(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

(let [options
       {:number true
        :relativenumber true}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

{}
