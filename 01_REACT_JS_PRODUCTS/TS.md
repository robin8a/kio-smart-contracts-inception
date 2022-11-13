# FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory
- Solution: https://support.snyk.io/hc/en-us/articles/360002046418-JavaScript-heap-out-of-memory

```sh
export NODE_OPTIONS=--max-old-space-size=8192
```



                           # Executing command: npm ci
2022-11-09T21:36:37.691Z [WARNING]: npm
2022-11-09T21:36:37.693Z [WARNING]: ERR! code ERESOLVE
2022-11-09T21:36:37.695Z [WARNING]: npm
2022-11-09T21:36:37.695Z [WARNING]: ERR! ERESOLVE could not resolve
                                    npm ERR!
                                    npm ERR!
2022-11-09T21:36:37.696Z [WARNING]: While resolving: material-ui@1.0.0-beta.46
                                    npm ERR! Found: react@18.1.0
                                    npm ERR! node_modules/react
                                    npm ERR!   react@"^18.1.0" from the root project
                                    npm ERR!   peer react@">= 16.8.0" from @aws-amplify/ui-react@2.20.0
                                    npm ERR!   node_modules/@aws-amplify/ui-react
                                    npm ERR!     @aws-amplify/ui-react@"^2.20.0" from the root project
                                    npm ERR!   33 more (@radix-ui/react-presence, @radix-ui/react-presence, ...)
                                    npm ERR!
                                    npm ERR! Could not resolve dependency:
                                    npm ERR! peer react@"^15.3.0 || ^16.0.0" from material-ui@1.0.0-beta.46
                                    npm ERR! node_modules/material-ui
                                    npm ERR!   peer material-ui@"^1.0.0-beta.16" from material-ui-icons@1.0.0-beta.36
                                    npm ERR!   node_modules/material-ui-icons
                                    npm ERR!     material-ui-icons@"^1.0.0-beta.36" from the root project
                                    npm ERR!
                                    npm ERR! Conflicting peer dependency: react@16.14.0
                                    npm ERR! node_modules/react
                                    npm ERR!   peer react@"^15.3.0 || ^16.0.0" from material-ui@1.0.0-beta.46
                                    npm ERR!   node_modules/material-ui
                                    npm ERR!     peer material-ui@"^1.0.0-beta.16" from material-ui-icons@1.0.0-beta.36
                                    npm ERR!     node_modules/material-ui-icons
                                    npm ERR!       material-ui-icons@"^1.0.0-beta.36" from the root project
                                    npm ERR!
                                    npm ERR! Fix the upstream dependency conflict, or retry
                                    npm ERR! this command with --force, or --legacy-peer-deps
                                    npm ERR! to accept an incorrect (and potentially broken) dependency resolution.