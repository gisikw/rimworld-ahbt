.PHONY: deploy check-env

deploy: check-env
	mkdir -p "$(RIMWORLD_PATH)/mods/AHBT"
	cp -r * "$(RIMWORLD_PATH)/mods/AHBT"

check-env:
ifndef RIMWORLD_PATH
	$(error RIMWORLD_PATH is undefined)
endif
