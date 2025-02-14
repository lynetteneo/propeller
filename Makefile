# SPDX-License-Identifier: LGPL-2.1-only
# Copyright (C) 2021 Seagate Technology LLC and/or its Affiliates.

SUBDIRS = src python test

.PHONY: all $(SUBDIRS) clean install cscope

all:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@; \
	done
	rm -rf cscope.*

install:
	$(MAKE) -C src $@

cscope:
	@echo "  CSCOPE"
	${Q}find ${CURDIR} -name "*.[ch]" > cscope.files
	${Q}cscope -b -q -k
