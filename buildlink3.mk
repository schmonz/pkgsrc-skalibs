# $NetBSD: buildlink3.mk,v 1.13 2025/07/08 21:13:37 schmonz Exp $

BUILDLINK_TREE+=	skalibs

.if !defined(SKALIBS_BUILDLINK3_MK)
SKALIBS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.skalibs+=		skalibs>=2.14.4.0nb2
BUILDLINK_PKGSRCDIR.skalibs?=		../../devel/skalibs

SKALIBS_TOLERATE_TARGET_SKEW?=		yes
.if !empty(SKALIBS_TOLERATE_TARGET_SKEW:M[yY][eE][sS])
SKALIBS_TARGET_cmd=			${CAT} ${PREFIX}/lib/skalibs/sysdeps/target
CONFIGURE_ARGS+=			--target=${SKALIBS_TARGET_cmd:sh}

SUBST_CLASSES+=				skalibs-target
SUBST_STAGE.skalibs-target=		post-configure
SUBST_FILES.skalibs-target=		config.mak
SUBST_SED.skalibs-target=		-e 's|\(CROSS_COMPILE := \).*|\1|'
.endif # SKALIBS_TOLERATE_TARGET_SKEW

.include "shlibs.mk"

.endif # SKALIBS_BUILDLINK3_MK

BUILDLINK_TREE+=	-skalibs
