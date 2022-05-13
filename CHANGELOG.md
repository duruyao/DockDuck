# 0.9.0 (2022-05-13)


### Bug Fixes

* add console print functions for all scripts ([c15764b](https://github.com/duruyao/DockDuck/commit/c15764b0690109443b3e12d153a0d9087df3f521)), closes [#4](https://github.com/duruyao/DockDuck/issues/4)
* basic image name contains "/" ([32c11c2](https://github.com/duruyao/DockDuck/commit/32c11c2747e091dfb66dcfa64d3f6bfdda097f64))
* bug(s) extracting repository and tag from docker image ([0db2e68](https://github.com/duruyao/DockDuck/commit/0db2e6814c288aa165b37c4c6a71cb310e3d1ed3))
* cannot insert a line to the 1st line of a empty file ([8e60175](https://github.com/duruyao/DockDuck/commit/8e60175e396bd40fe529e1b69ce35d4404bdb0b0))
* change `dk-complete` path in the file `~/.bashrc` ([7be6202](https://github.com/duruyao/DockDuck/commit/7be62020d81dd7f70438ad78aa56f2de1497ceda))
* check image exists by using command `docker images -q IMAGE` ([778cb1e](https://github.com/duruyao/DockDuck/commit/778cb1e5d3e911928804d67994c470d88c3581d3)), closes [#1](https://github.com/duruyao/DockDuck/issues/1)
* default NEW_IMAGE cover passed NEW_IMAGE ([e4c7145](https://github.com/duruyao/DockDuck/commit/e4c714567cc32e7410b3ced566883a9127d502a5))
* env vars missing for normal users ([31fb6e9](https://github.com/duruyao/DockDuck/commit/31fb6e9cf65de2457eac4870ea149398c4d0488a))
* fix bug that decimal plus hex ([f325735](https://github.com/duruyao/DockDuck/commit/f325735bc4fb7853f2d8602ec89d05dac635b86e))
* fix bug: DK_HOME: unbound variable ([b9b287f](https://github.com/duruyao/DockDuck/commit/b9b287fe57e26df12ad2097756eaf2e694c63874))
* fix error passing args ([4405fba](https://github.com/duruyao/DockDuck/commit/4405fbaf0b39001bd24ef54bc3e4511cf6b626af))
* fix string 'DockDucK' to 'DockDuck' ([85bc86c](https://github.com/duruyao/DockDuck/commit/85bc86c7d2da79a3b6be7d7a7b03207e006c5b9c))
* refresh path/to/containers.txt before `dk ps` ([34884c9](https://github.com/duruyao/DockDuck/commit/34884c94d4d476edf5b5d5a9d4b6510172ffc9dd)), closes [#2](https://github.com/duruyao/DockDuck/issues/2)
* unable to terminate while loop of parsing args ([2b1860c](https://github.com/duruyao/DockDuck/commit/2b1860cdcd2f7f1ed87b1b810d7e5687d6678a35))


### Features

* add 000-todo-all.sh ([45600af](https://github.com/duruyao/DockDuck/commit/45600af77531eb8866bdb0281cefd7418ddd3548))
* add build.sh for building docker image according an existed image ([d7864b7](https://github.com/duruyao/DockDuck/commit/d7864b7966110228ac0b1bd44ccd4f30fee29835))
* add cli to update dk tools ([3463929](https://github.com/duruyao/DockDuck/commit/3463929e7913105bf2b3354f53391d0744512f0f))
* add dk-run (unfinished) ([a3c14af](https://github.com/duruyao/DockDuck/commit/a3c14af2b697e411137c2a67585a0d3eadbeb560))
* add install.sh for installing tools of DockerDK ([2fbbf8f](https://github.com/duruyao/DockDuck/commit/2fbbf8fe232598c33f3195c8f959155531e79363))
* add more commands in Dockerfile ([f663c3c](https://github.com/duruyao/DockDuck/commit/f663c3c04c148804b438347a22ae4062975adba1))
* add sub command 'images' ([11fcb89](https://github.com/duruyao/DockDuck/commit/11fcb8913914e3874edd44adb858438f5a8e8ee3))
* add uninstall tool ([325f6d3](https://github.com/duruyao/DockDuck/commit/325f6d3a0096f0080b4d91c157bfeee0e9081dc7))
* change version id to v2022.03.18 ([ccec2a4](https://github.com/duruyao/DockDuck/commit/ccec2a41eae1f0596a1491e550c1d34d8926a342))
* check if docker exist ([776c40f](https://github.com/duruyao/DockDuck/commit/776c40f58b3459740938bfbe221d824bc849c0c6))
* check sth and show warning info ([6092c14](https://github.com/duruyao/DockDuck/commit/6092c1476367881df4b29173b1cd52d5d531a032))
* copy tools/* to DK_HOME/ ([505e7d5](https://github.com/duruyao/DockDuck/commit/505e7d5bc70cede33c5fd421b346785f20f6b863))
* deprecate the risky command option '--other-flags' ([f592610](https://github.com/duruyao/DockDuck/commit/f592610c5ade6d0155120608fcde6280320be452))
* dk as the entry of application ([682ecf1](https://github.com/duruyao/DockDuck/commit/682ecf18a5c28ce6c6f21376fb0180c970978c41))
* dk as the entry of using dock-duck ([39e746b](https://github.com/duruyao/DockDuck/commit/39e746beb4599b863f357dfb070ce4bd71d981a6))
* docker ... --login DK_HOME/with-the-same-user ([6e7751a](https://github.com/duruyao/DockDuck/commit/6e7751ab421b117517de7fa385fc9b346f96adae))
* finish 80% features (unfinished) ([94a8c77](https://github.com/duruyao/DockDuck/commit/94a8c77b378e2f95f11a08cc6eb0f98d9cb1882a))
* finish 90% features (unfinished) ([ec62584](https://github.com/duruyao/DockDuck/commit/ec62584b9a2e35679c1282ad4744a7df2033f8f8))
* finish but untest ([3c105f3](https://github.com/duruyao/DockDuck/commit/3c105f3e57b563dbec0adce95eafdbea01361c31))
* finish coding of dk-stop (untested) ([14c1b1a](https://github.com/duruyao/DockDuck/commit/14c1b1acbd5c70236d77aad306b50f3c8b8b7992))
* finish dk-attach (untested) ([dfc7871](https://github.com/duruyao/DockDuck/commit/dfc78712759a30c127854d78d64ff0b0f061a543))
* finish dk-detach (untested) ([038d821](https://github.com/duruyao/DockDuck/commit/038d821af52905d24715018c7766be6e9ee70c90))
* finish dk-ps (untested) ([96c1184](https://github.com/duruyao/DockDuck/commit/96c1184a7b44a1480189610567a6f17ec844b266))
* finish dk-run adn dk-detach (tested) ([fa61138](https://github.com/duruyao/DockDuck/commit/fa611384f66bb87f0e2d51b536b51aa92c50a452))
* ininstall the application and save the container information ([b903fa2](https://github.com/duruyao/DockDuck/commit/b903fa222ab274c0ef77d62855ccce4331b91c73))
* new version id ([2ec6040](https://github.com/duruyao/DockDuck/commit/2ec604039b1d26b14133ebe8f6a6cbb175c551fe))
* support auto-complete options for sub-command ([ea4029d](https://github.com/duruyao/DockDuck/commit/ea4029dcc78800871c8c850389a25b10f8e12a51))
* support auto-completing command lines ([40bd00e](https://github.com/duruyao/DockDuck/commit/40bd00e57e519d172df0280558cf851ab9a39c9f))
* support login as admin or same user of host ([a2f54a4](https://github.com/duruyao/DockDuck/commit/a2f54a4185a3a9117aa9e4e7fec6f0dfff532c97))
* type `dk uninstall` to uninstall dock-duck tools ([5f6bcc9](https://github.com/duruyao/DockDuck/commit/5f6bcc9ade64a048648f0ab476a96795a281807c))
* update version id to 2022.03.20 ([066de67](https://github.com/duruyao/DockDuck/commit/066de672cb67f2432b644b07841470ccd9d7ae65))
* update version id to 2022.03.22 ([bf2e917](https://github.com/duruyao/DockDuck/commit/bf2e917c1b5a2d58f852689f1c6bddf2621e4a1b))
* use '${USER}+${IMAGE}+${CONTAINER}' as seed before generating random ports ([14bc545](https://github.com/duruyao/DockDuck/commit/14bc54590dc4ce5b3fa6c77eed01a8a16ca04273))
* use docker instead of dk when passing unsupported options ([f5b6d4b](https://github.com/duruyao/DockDuck/commit/f5b6d4be904e97b76ee9294d1f01d13ae85fa2b3))


### Performance Improvements

* fix warning(s) of bash shell script ([c933b5d](https://github.com/duruyao/DockDuck/commit/c933b5d504949792e8d16316f3606b73c01975aa))
* improve the rules for automatic naming hostname ([e04f272](https://github.com/duruyao/DockDuck/commit/e04f2725839531af9a5742093a52ffde0bdde6d3))
* replace `sed -i "s/LINE//" FILE` with `sed -i "/LINE/d" FILE` ([43a21f1](https://github.com/duruyao/DockDuck/commit/43a21f1fe2830e802ea8921eb2f52d34cdf2ffd2))



