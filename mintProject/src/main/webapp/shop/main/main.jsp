<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<main class="main">
    <!-- 배너 -->
    <div class="main__banner">
        <div class="swiper-container main__banner-slide">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="">
                        <img
                            src="//img-cf.kurly.com/shop/data/main/1/pc_img_1574925170.jpg"
                            alt=""
                        />
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="">
                        <img
                            src="//img-cf.kurly.com/shop/data/main/1/pc_img_1572599646.jpg"
                            alt=""
                        />
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="">
                        <img
                            src="//img-cf.kurly.com/shop/data/main/1/pc_img_1572494957.jpg"
                            alt=""
                        />
                    </a>
                </div>
            </div>
        </div>
        <button class="banner-slide-btn banner-btn--left" id="banner-pre">
            <img
                src="/mintProject/shop/storage/mint/icon/prev-btn.png"
                alt=""
            />
        </button>
        <button class="banner-slide-btn banner-btn--right" id="banner-next">
            <img
                src="/mintProject/shop/storage/mint/icon/next-btn.png"
                alt=""
            />
        </button>
    </div>

    <!-- 이 상품 어때요 슬라이더 -->
    <div class="main__event">
        <div class="main__event-tit">
            이 상품 어때요?
        </div>
        <div class="swiper-container main__event-slide1">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <!-- 컨텐트가 슬라이더 안에 들어가는 아이템들 짝수 단위로 넣어주세요
                            컨테트는 swiper-slide요소 안에 있어야 돼요-->
                    <div class="main__event-content">
                        <img
                            class="discount-rate"
                            src="/mintProject/shop/storage/mint/icon/distate-20.png"
                            alt=""
                        />

                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1543978436993l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">[네니아] 물만두</span>
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="main__event-content">
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1543384498465l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">[네니아] 물만두</span>
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1523423541918l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">[네니아] 물만두</span>
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1574919797362l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name"
                                >[듀오락] 데일리키즈 프로바이오틱스 유산균 1통
                                (30일분)</span
                            >
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button class="event-slide-btn slide-btn--right" id="event1-pre">
            <img
                src="/mintProject/shop/storage/mint/icon/prev-btn-default.png"
                alt=""
            />
        </button>
        <button class="event-slide-btn slide-btn--left" id="event1-next">
            <img
                src="/mintProject/shop/storage/mint/icon/next-btn-default.png"
                alt=""
            />
        </button>
    </div>

    <!-- 일일 특가 -->
    <div class="main__special">
        <div class="main__special-tit">
            <h3>일일 특가</h3>
            <div class="tit-desc">
                매일 오전 11시, 베스트 상품 24HR한정특가!
            </div>
            <div class="main__special-deco">
                <img
                    src="https://res.kurly.com/pc/service/main/1907/ico_hook.png"
                    alt=""
                />
                망설이면 늦어요!
            </div>
        </div>

        <div class="main__special-content">
            <a class="main__special-thumb" href="">
                <img
                    class="discount-rate"
                    src="/mintProject/shop/storage/mint/icon/distate-20.png"
                    alt=""
                />
                <img
                    src="https://img-cf.kurly.com/shop/data/goods/1574932903992z0.jpg"
                    alt=""
                    class="special-thumb"
                />
                <div class="main__special-count">
                    <div class="special-count">15:25:00</div>
                    남음
                </div>
            </a>
            <div class="main__special-info">
                <div class="main__special-subject">
                    [미스터비엣] 인스턴트 커피 더블세트 (블랙 + 4in1)
                </div>

                <div class="main__special-desc">
                    베트남의 맛과 향기를 그대로
                </div>
                <div class="main__speical-total">
                    <span class="main__special-price">
                        8,650원
                    </span>
                    <span class="main__special-cost">
                        17,300원
                    </span>
                </div>
            </div>
        </div>
    </div>

    <!-- 알뜰 상품 슬라이더 -->
    <div class="main__event">
        <div class="main__event-tit">
            <a href="">알뜰 상품</a>
        </div>
        <div class="swiper-container main__event-slide2">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <img
                            class="discount-rate"
                            src="/mintProject/shop/storage/mint/icon/distate-20.png"
                            alt=""
                        />
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1543978436993l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">[네니아] 물만두</span>
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="main__event-content">
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1543384498465l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">[네니아] 물만두</span>
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1523423541918l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">[네니아] 물만두</span>
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1574919797362l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name"
                                >[듀오락] 데일리키즈 프로바이오틱스 유산균 1통
                                (30일분)</span
                            >
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button class="event-slide-btn slide-btn--right" id="event2-pre">
            <img
                src="/mintProject/shop/storage/mint/icon/prev-btn-default.png"
                alt=""
            />
        </button>
        <button class="event-slide-btn slide-btn--left" id="event2-next">
            <img
                src="/mintProject/shop/storage/mint/icon/next-btn-default.png"
                alt=""
            />
        </button>
    </div>

    <!-- 이벤트 소식 -->
    <div class="main__news">
        <div class="main__event-tit">
            <a href="">이벤트 소식</a>
        </div>
        <ul class="news__list">
            <li class="news__item">
                <a href=""
                    ><img
                        src="//img-cf.kurly.com/shop/data/main/3/pc_img_1574819821.jpg"
                        alt=""
                        class="news__thumb"
                /></a>
                <div class="news__subject">사미헌 최대 20% 할인</div>
                <div class="news__desc">부산 소고기의 명가</div>
            </li>

            <li class="news__item">
                <a href=""
                    ><img
                        src="//img-cf.kurly.com/shop/data/main/3/pc_img_1574819821.jpg"
                        alt=""
                        class="news__thumb"
                /></a>
                <div class="news__subject">사미헌 최대 20% 할인</div>
                <div class="news__desc">부산 소고기의 명가</div>
            </li>

            <li class="news__item">
                <a href=""
                    ><img
                        src="//img-cf.kurly.com/shop/data/main/3/pc_img_1574819821.jpg"
                        alt=""
                        class="news__thumb"
                /></a>
                <div class="news__subject">사미헌 최대 20% 할인</div>
                <div class="news__desc">부산 소고기의 명가</div>
            </li>
        </ul>
    </div>

    <!-- 신상품 슬라이더 -->
    <div class="main__event">
        <div class="main__event-tit">
            <a href="">오늘의 신상품</a>
        </div>
        <div class="swiper-container main__event-slide3">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <img
                            class="discount-rate"
                            src="/mintProject/shop/storage/mint/icon/distate-20.png"
                            alt=""
                        />
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1543978436993l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">[네니아] 물만두</span>
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="main__event-content">
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1543384498465l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">[네니아] 물만두</span>
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1523423541918l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">[네니아] 물만두</span>
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <a href="">
                            <img
                                src="https://img-cf.kurly.com/shop/data/goods/1574919797362l0.jpg"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name"
                                >[듀오락] 데일리키즈 프로바이오틱스 유산균 1통
                                (30일분)</span
                            >
                            <span class="info-price">11,880원</span>
                            <span class="info-cost">13,200원</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button class="event-slide-btn slide-btn--right" id="event3-pre">
            <img
                src="/mintProject/shop/storage/mint/icon/prev-btn-default.png"
                alt=""
            />
        </button>
        <button class="event-slide-btn slide-btn--left" id="event3-next">
            <img
                src="/mintProject/shop/storage/mint/icon/next-btn-default.png"
                alt=""
            />
        </button>
    </div>
</main>
<script src="/mintProject/shop/js/main.js"></script>
