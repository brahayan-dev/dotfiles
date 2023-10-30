(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

(let [options
       {:number true
        :expandtap true
        :relativenumber true
	:clipboard "unnamedplus"}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

{}
