# $NetBSD: Makefile,v 1.2 2018/06/22 16:16:53 schmonz Exp $

DISTNAME=		skalibs-2.6.0.0
CATEGORIES=		devel
MASTER_SITES=		http://skarnet.org/software/skalibs/

MAINTAINER=		cfkoch@edgebsd.org
HOMEPAGE=		http://skarnet.org/software/skalibs/
COMMENT=		The skarnet.org C system programming library
LICENSE=		isc

USE_LANGUAGES=		c
HAS_CONFIGURE=		yes
USE_TOOLS+=		gmake

PLIST_VARS+=		include-shared-objects
PLIST.include-shared-objects=	yes

CONFIGURE_ARGS+=	"--prefix=${PREFIX}"

.if "${OPSYS}" == "Darwin"
PLIST.include-shared-objects=	no
CONFIGURE_ARGS+=	"--disable-shared"
.endif

.include "../../mk/bsd.pkg.mk"
