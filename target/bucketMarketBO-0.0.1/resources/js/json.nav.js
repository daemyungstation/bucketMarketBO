$.params.tree = {
    "child": [{
        "name": "대시보드",
        "src": "https://localhost:8443/bo/main/dashboardMain.do"
    }, {
        "child": [{
            "name": "회원관리",
            "src": "https://localhost:8443/bo/member/infoMemberList.do"
        }, {
            "name": "휴면회원관리",
            "src": "https://localhost:8443/bo/member/restMemberList.do"
        }, {
            "name": "탈퇴회원관리",
            "src": "https://localhost:8443/bo/member/secessionMemberList.do"
        }],
        "name": "회원관리",
        "src": "https://localhost:8443/bo/member/infoMemberList.do"
    }, {
        "child": [{
            "name": "전시카테고리관리",
            "src": "https://localhost:8443/bo/product/categoryProductList.do"
        }, {
            "name": "상품관리",
            "src": "https://localhost:8443/bo/product/basicProductList.do"
        }, {
            "name": "상품고시관리",
            "src": "https://localhost:8443/bo/product/productNotificationInfoList.do"
        }, {
            "name": "입점업체 승인요청",
            "src": "https://localhost:8443/bo/product/vendorApprovalList.do"
        }, {
            "name": "입점업체 상품변경요청",
            "src": "https://localhost:8443/bo/product/vendorProductChangeList.do"
        }, {
            "name": "일괄업로드",
            "src": "https://localhost:8443/bo/product/productUploadList.do"
        }, {
            "name": "사은품관리",
            "src": "https://localhost:8443/bo/product/giftList.do"
        }, {
            "name": "견적관리",
            "src": "https://localhost:8443/bo/product/estimateManagementList.do"
        }, {
            "name": "스펙관리",
            "src": "https://localhost:8443/bo/product/specManagementList.do"
        }],
        "name": "상품관리",
        "src": "https://localhost:8443/bo/product/basicProductList.do"
    }, {
        "child": [{
            "name": "전체주문",
            "src": "https://localhost:8443/bo/order/orderList.do?searchYn=Y"
        }, {
            "name": "입금대기",
            "src": "https://localhost:8443/bo/order/orderPayReadyList.do?searchYn=Y"
        }, {
            "name": "결제완료",
            "src": "https://localhost:8443/bo/order/orderPayList.do?searchYn=Y"
        }, {
            "name": "배송관리",
            "src": "https://localhost:8443/bo/order/orderSendList.do?searchYn=Y"
        }, {
            "name": "구매확정",
            "src": "https://localhost:8443/bo/order/orderFixList.do?searchYn=Y"
        }, {
            "name": "취소관리",
            "src": "https://localhost:8443/bo/order/orderCancelList.do?searchYn=Y"
        }, {
            "name": "교환관리",
            "src": "https://localhost:8443/bo/order/orderSwapList.do?searchYn=Y"
        }, {
            "name": "반품관리",
            "src": "https://localhost:8443/bo/order/orderBackList.do?searchYn=Y"
        }, {
            "name": "환불관리",
            "src": "https://localhost:8443/bo/order/orderRefundList.do?searchYn=Y"
        }, {
            "name": "세금계산서 신청관리",
            "src": "https://localhost:8443/bo/order/taxIvc/taxIvcList.do"
        }, {
            "name": "입점업체취소요청",
            "src": "https://localhost:8443/bo/order/orderScmCancelList.do?searchYn=Y"
        }, {
            "name": "오픈마켓 주문조회",
            "src": "https://localhost:8443/bo/order/orderOpenMarketList.do?searchYn=Y"
        }, {
            "name": "입점업체 주문조회(통합)",
            "src": "https://localhost:8443/bo/order/orderScmOrderList.do?searchYn=Y"
        }, {
            "name": "입점업체 주문조회(SCM) ",
            "src": "https://localhost:8443/bo/order/orderOnlyScmOrderList.do?searchYn=Y"
        }, {
            "name": "결제오류조회",
            "src": "https://localhost:8443/bo/order/orderError/orderErrorList.do"
        }, {
            "name": "출고관리",
            "src": "https://localhost:8443/bo/order/orderDeliveryList.do"
        }, {
            "name": "O2O 주문조회",
            "src": "https://localhost:8443/bo/order/orderCleanKingList.do"
        }],
        "name": "주문관리",
        "src": "https://localhost:8443/bo/order/orderList.do"
    }, {
        "child": [{
            "name": "전시배너관리",
            "src": "https://localhost:8443/bo/display/bannerDisplayView.do"
        }, {
            "name": "전시상품관리",
            "src": "https://localhost:8443/bo/display/productDisplayView.do"
        }, {
            "name": "팝업관리",
            "src": "https://localhost:8443/bo/display/popupList.do"
        }, {
            "name": "공통전시",
            "src": "https://localhost:8443/bo/display/vendorDisplayView.do"
        }, {
            "name": "테마전시배너관리",
            "src": "https://localhost:8443/bo/display/themeBannerView.do"
        }, {
            "name": "테마전시상품관리",
            "src": "https://localhost:8443/bo/display/themeProductView.do"
        }, {
            "name": "브랜드공지관리",
            "src": "https://localhost:8443/bo/display/bannerProductBrandNoticeList.do"
        }, {
            "name": "MD공지관리",
            "src": "https://localhost:8443/bo/display/bannerProductMdNoticeList.do"
        }, {
            "name": "광고관리",
            "src": "https://localhost:8443/bo/display/adList.do"
        }],
        "name": "전시관리",
        "src": "https://localhost:8443/bo/display/privateShopList.do"
    }, {
        "child": [{
            "name": "기획전관리",
            "src": "https://localhost:8443/bo/marketing/planList.do"
        }, {
            "name": "이벤트관리",
            "src": "https://localhost:8443/bo/marketing/eventList.do"
        }, {
            "name": "고객체험단",
            "src": "https://localhost:8443/bo/marketing/kingerList.do"
        }, {
            "name": "원데이특가",
            "src": "https://localhost:8443/bo/marketing/oneDayList.do"
        }, {
            "name": "게릴라 세일",
            "src": "https://localhost:8443/bo/marketing/timeSaleList.do"
        }, {
            "child": [{
                "name": "쿠폰목록",
                "src": "https://localhost:8443/bo/marketing/onlineCouponList.do"
            }, {
                "name": "쿠폰생성",
                "src": "https://localhost:8443/bo/marketing/onlineCouponForm.do"
            }, {
                "name": "쿠폰발행내역",
                "src": "https://localhost:8443/bo/marketing/onlineCouponIssueList.do"
            }],
            "name": "쿠폰",
            "src": "https://localhost:8443/"
        }, {
            "child": [{
                "name": "포인트 내역조회",
                "src": "https://localhost:8443/bo/marketing/pointDetail.do"
            }, {
                "name": "포인트 리스트",
                "src": "https://localhost:8443/bo/marketing/pointList.do"
            }, {
                "name": "포인트 적립/차감",
                "src": "https://localhost:8443/bo/marketing/pointForm.do"
            }],
            "name": "포인트",
            "src": "https://localhost:8443/"
        }, {
            "name": "카드행사관리",
            "src": "https://localhost:8443/bo/marketing/cardEventList.do"
        }, {
            "name": "카드할부관리",
            "src": "https://localhost:8443/bo/marketing/cardDivList.do"
        }, {
            "name": "채널관리",
            "src": "https://localhost:8443/bo/marketing/channelView.do"
        }],
        "name": "프로모션관리",
        "src": "https://localhost:8443/bo/marketing/promotionList.do"
    }, {
        "child": [{
            "name": "게시판 생성",
            "src": "https://localhost:8443/bo/createboard/createBoardList.do"
        }],
        "name": "게시판 관리",
        "src": "https://localhost:8443/bo/createboard/createBoardList.do"
    }, {
        "child": [{
            "name": "공지사항",
            "src": "https://localhost:8443/bo/board/noticeBoardList.do"
        }, {
            "name": "FAQ",
            "src": "https://localhost:8443/bo/board/faqBoardList.do"
        }, {
            "name": "상품후기",
            "src": "https://localhost:8443/bo/board/commentBoardList.do"
        }, {
            "name": "상품Q&A",
            "src": "https://localhost:8443/bo/board/productInquiryList.do"
        }, {
            "name": "1:1 문의",
            "src": "https://localhost:8443/bo/board/inquiryList.do"
        }, {
            "name": "약관관리",
            "src": "https://localhost:8443/bo/board/agreementBoardList.do"
        }],
        "name": "고객센터",
        "src": "https://localhost:8443/bo/board/noticeBoardList.do"
    }, {
        "child": [{
            "name": "로고목록",
            "src": "https://localhost:8443/bo/logo/logoList.do"
        }],
        "name": "로고관리",
        "src": "https://localhost:8443/bo/logo/logoList.do"
    }, {
        "child": [{
            "name": "SNS관리",
            "src": "https://localhost:8443/bo/sns/snsManagerList.do"
        }],
        "name": "SNS관리",
        "src": "https://localhost:8443/bo/sns/snsManagerList.do"
    }, {
        "child": [{
            "name": "회원통계",
            "src": "https://localhost:8443/bo/stats/memberJoinDateList.do"
        }, {
            "name": "매출통계",
            "src": "https://localhost:8443/bo/stats/orderStatsSalesList.do"
        }, {
            "name": "매장별통계",
            "src": "https://localhost:8443/bo/stats/orderMallStatsShopList.do"
        }, {
            "name": "채널별매출",
            "src": "https://localhost:8443/bo/stats/orderChannelList.do"
        }],
        "name": "통계",
        "src": "https://localhost:8443/"
    }, {
        "child": [{
            "name": "입점업체공지사항",
            "src": "https://localhost:8443/bo/vendor/vendorNoticeList.do"
        }, {
            "name": "입점업체문의사항",
            "src": "https://localhost:8443/bo/vendor/vendorInqList.do"
        }, {
            "name": "입점상담 업체관리",
            "src": "https://localhost:8443/bo/vendor/vendorLoginManagerList.do"
        }, {
            "name": "입점상담 관리",
            "src": "https://localhost:8443/bo/vendor/vendorCounselList.do"
        }, {
            "name": "입점신청서 관리",
            "src": "https://localhost:8443/bo/vendor/vendorReqList.do"
        }],
        "name": "입점업체관리",
        "src": "https://localhost:8443/bo/vendor/vendorNoticeList.do"
    }, {
        "child": [{
            "name": "정보수정",
            "src": "https://localhost:8443/bo/info/managerInfoEdit.do"
        }],
        "name": "관리자정보수정",
        "src": "https://localhost:8443/bo/info/managerInfoEdit.do"
    }, {
        "child": [{
            "name": "관리자 관리",
            "src": "https://localhost:8443/bo/site/basicManagerList.do"
        }, {
            "name": "권한 관리",
            "src": "https://localhost:8443/bo/site/authManagerList.do"
        }, {
            "name": "메뉴 관리",
            "src": "https://localhost:8443/bo/site/menuManagerList.do"
        }, {
            "name": "입점업체정보 관리",
            "src": "https://localhost:8443/bo/site/vendorManagerList.do"
        }, {
            "name": "브랜드 관리",
            "src": "https://localhost:8443/bo/site/brandManagerList.do"
        }, {
            "name": "제조사 관리",
            "src": "https://localhost:8443/bo/site/makerManagerList.do"
        }, {
            "name": "배송업체 관리",
            "src": "https://localhost:8443/bo/site/delivCompanyList.do"
        }, {
            "name": "차단단어 관리",
            "src": "https://localhost:8443/bo/site/banWordManagerList.do"
        }, {
            "name": "공통코드관리",
            "src": "https://localhost:8443/bo/site/commonCodeManagerList.do"
        }, {
            "name": "인기 검색어 관리",
            "src": "https://localhost:8443/bo/site/popularSearchWordList.do"
        }],
        "name": "시스템 관리",
        "src": "https://localhost:8443/bo/site/basicManagerList.do"
    }, {
        "child": [{
            "child": [{
                "name": "정산목록",
                "src": "https://localhost:8443/bo/accounting/companyAccountingList.do"
            }, {
                "name": "업체별상세",
                "src": "https://localhost:8443/bo/accounting/companyAccountingDetail.do"
            }],
            "name": "업체정산",
            "src": "https://localhost:8443/"
        }],
        "name": "정산",
        "src": "https://localhost:8443/"
    }, {
        "child": [{
            "name": "APP 푸시관리",
            "src": "https://localhost:8443/bo/app/appPushManageList.do"
        }, {
            "name": "APP 버전관리",
            "src": "https://localhost:8443/bo/app/appVersionManageList.do"
        }],
        "name": "APP 관리",
        "src": "https://localhost:8443/bo/app/appPushManageList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "https://localhost:8443/bo/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "https://localhost:8443/bo/target/targetList.do"
    }]
};
