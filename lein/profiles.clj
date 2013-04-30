{:user
  {:dependencies [[alembic "0.1.0"]
                  [org.clojure/tools.namespace "0.2.3"]
                  [repetition-hunter "0.3.0"]
                  [bultitude "0.2.2"]]
   :plugins [[lein-catnip "0.5.1"]
             [lein-kibit "0.0.8"]
             [lein-guzheng "0.4.2"]
             [lein-pprint "1.1.1"]
             [lein-environ "0.4.0"]]
   :injections [(require 'clojure.pprint)
                (require '[alembic.still :refer [distill]])
                (require '[clojure.tools.namespace.repl :refer [refresh]])
                (require '[repetition.hunter :refer [hunt]])
                (require '[bultitude.core :refer [namespaces-on-classpath]])]
   :repl-options {:print clojure.pprint/pprint :color true :standalone true}}
 }
