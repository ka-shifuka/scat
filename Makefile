DIST_FOLDER = _dist
GAME_LOVE = ${DIST_FOLDER}/game.love
EXCLUDE_ZIP = _dist/**\* .git/**\* Makefile .gitignore .editorconfig .luarc.json .make.lua _web/**\*

zip:
	${MAKE} destroy
	mkdir ${DIST_FOLDER}/
	zip -r0 ${GAME_LOVE} . -x ${EXCLUDE_ZIP}

destroy:
	rm -rf ${DIST_FOLDER}/ 
