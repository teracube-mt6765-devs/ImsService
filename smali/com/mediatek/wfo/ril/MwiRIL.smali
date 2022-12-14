.class public final Lcom/mediatek/wfo/ril/MwiRIL;
.super Lcom/mediatek/wfo/ril/MwiBaseCommands;
.source "MwiRIL.java"

# interfaces
.implements Lcom/mediatek/wfo/ril/MwiCommandsInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/wfo/ril/MwiRIL$RadioProxyDeathRecipient;,
        Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;,
        Lcom/mediatek/wfo/ril/MwiRIL$WfcConfigType;
    }
.end annotation


# static fields
.field private static final DEFAULT_ACK_WAKE_LOCK_TIMEOUT_MS:I = 0xc8

.field private static final DEFAULT_WAKE_LOCK_TIMEOUT_MS:I = 0xea60

.field static final EVENT_ACK_WAKE_LOCK_TIMEOUT:I = 0x4

.field static final EVENT_BLOCKING_RESPONSE_TIMEOUT:I = 0x5

.field static final EVENT_RADIO_PROXY_DEAD:I = 0x6

.field static final EVENT_SEND:I = 0x1

.field static final EVENT_WAKE_LOCK_TIMEOUT:I = 0x2

.field public static final FOR_ACK_WAKELOCK:I = 0x1

.field public static final FOR_WAKELOCK:I = 0x0

.field static final IMS_HIDL_SERVICE_NAME:[Ljava/lang/String;

.field public static final INVALID_WAKELOCK:I = -0x1

.field static final IRADIO_GET_SERVICE_DELAY_MILLIS:I = 0xfa0

.field static final MWIRIL_LOGD:Z = true

.field static final MWIRIL_LOGV:Z = false

.field static final MWIRIL_LOG_TAG:Ljava/lang/String; = "MwiRIL"

.field static final MWI_RILA_LOGD:Z = true

.field static final PROPERTY_WAKE_LOCK_TIMEOUT:Ljava/lang/String; = "ro.ril.wake_lock_timeout"

.field static final RILJ_ACK_WAKELOCK_NAME:Ljava/lang/String; = "MWIRIL_ACK_WL"

.field static final RIL_HISTOGRAM_BUCKET_COUNT:I = 0x5

.field static mRilTimeHistograms:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/telephony/TelephonyHistogram;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mAckWakeLock:Landroid/os/PowerManager$WakeLock;

.field final mAckWakeLockTimeout:I

.field volatile mAckWlSequenceNum:I

.field private mActiveWakelockWorkSource:Landroid/os/WorkSource;

.field private final mClientWakelockTracker:Lcom/android/internal/telephony/ClientWakelockTracker;

.field mContext:Landroid/content/Context;

.field mIsMobileNetworkSupported:Z

.field mLastNITZTimeInfo:[Ljava/lang/Object;

.field private mMetrics:Lcom/android/internal/telephony/metrics/TelephonyMetrics;

.field final mPhoneId:Ljava/lang/Integer;

.field private mRILDefaultWorkSource:Landroid/os/WorkSource;

.field mRadioIndication:Lcom/mediatek/wfo/ril/MwiRadioIndication;

.field volatile mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

.field final mRadioProxyCookie:Ljava/util/concurrent/atomic/AtomicLong;

.field final mRadioProxyDeathRecipient:Lcom/mediatek/wfo/ril/MwiRIL$RadioProxyDeathRecipient;

.field mRadioResponse:Lcom/mediatek/wfo/ril/MwiRadioResponse;

.field mRequestList:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/mediatek/wfo/ril/RILRequest;",
            ">;"
        }
    .end annotation
.end field

.field final mRilHandler:Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;

.field mTestingEmergencyCall:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final mWakeLock:Landroid/os/PowerManager$WakeLock;

.field mWakeLockCount:I

.field final mWakeLockTimeout:I

.field volatile mWlSequenceNum:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 280
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/mediatek/wfo/ril/MwiRIL;->mRilTimeHistograms:Landroid/util/SparseArray;

    .line 321
    const-string v0, "imsSlot1"

    const-string v1, "imsSlot2"

    const-string v2, "imsSlot3"

    const-string v3, "imsSlot4"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mediatek/wfo/ril/MwiRIL;->IMS_HIDL_SERVICE_NAME:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILandroid/os/Looper;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "instanceId"    # I
    .param p3, "looper"    # Landroid/os/Looper;

    .line 537
    invoke-direct {p0, p1, p2}, Lcom/mediatek/wfo/ril/MwiBaseCommands;-><init>(Landroid/content/Context;I)V

    .line 264
    new-instance v0, Lcom/android/internal/telephony/ClientWakelockTracker;

    invoke-direct {v0}, Lcom/android/internal/telephony/ClientWakelockTracker;-><init>()V

    iput-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mClientWakelockTracker:Lcom/android/internal/telephony/ClientWakelockTracker;

    .line 277
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWlSequenceNum:I

    .line 278
    iput v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWlSequenceNum:I

    .line 279
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    .line 286
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mTestingEmergencyCall:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 297
    invoke-static {}, Lcom/android/internal/telephony/metrics/TelephonyMetrics;->getInstance()Lcom/android/internal/telephony/metrics/TelephonyMetrics;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mMetrics:Lcom/android/internal/telephony/metrics/TelephonyMetrics;

    .line 307
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    .line 309
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v3, 0x0

    invoke-direct {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxyCookie:Ljava/util/concurrent/atomic/AtomicLong;

    .line 539
    iput-object p1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mContext:Landroid/content/Context;

    .line 540
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    .line 542
    const-string v2, "connectivity"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 544
    .local v2, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v2, v0}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v3

    iput-boolean v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mIsMobileNetworkSupported:Z

    .line 546
    new-instance v3, Lcom/mediatek/wfo/ril/MwiRadioResponse;

    invoke-direct {v3, p0, p2}, Lcom/mediatek/wfo/ril/MwiRadioResponse;-><init>(Lcom/mediatek/wfo/ril/MwiRIL;I)V

    iput-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioResponse:Lcom/mediatek/wfo/ril/MwiRadioResponse;

    .line 547
    new-instance v3, Lcom/mediatek/wfo/ril/MwiRadioIndication;

    invoke-direct {v3, p0, p2}, Lcom/mediatek/wfo/ril/MwiRadioIndication;-><init>(Lcom/mediatek/wfo/ril/MwiRIL;I)V

    iput-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioIndication:Lcom/mediatek/wfo/ril/MwiRadioIndication;

    .line 549
    new-instance v3, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;

    invoke-direct {v3, p0, p3}, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;-><init>(Lcom/mediatek/wfo/ril/MwiRIL;Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRilHandler:Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;

    .line 550
    new-instance v3, Lcom/mediatek/wfo/ril/MwiRIL$RadioProxyDeathRecipient;

    invoke-direct {v3, p0}, Lcom/mediatek/wfo/ril/MwiRIL$RadioProxyDeathRecipient;-><init>(Lcom/mediatek/wfo/ril/MwiRIL;)V

    iput-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxyDeathRecipient:Lcom/mediatek/wfo/ril/MwiRIL$RadioProxyDeathRecipient;

    .line 551
    const-string v3, "power"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    .line 552
    .local v3, "pm":Landroid/os/PowerManager;
    const/4 v4, 0x1

    const-string v5, "MwiRIL"

    invoke-virtual {v3, v4, v5}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 553
    invoke-virtual {v5, v0}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 554
    const-string v5, "MWIRIL_ACK_WL"

    invoke-virtual {v3, v4, v5}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 555
    invoke-virtual {v5, v0}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 556
    const-string v5, "ro.ril.wake_lock_timeout"

    const v6, 0xea60

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockTimeout:I

    .line 558
    const/16 v6, 0xc8

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWakeLockTimeout:I

    .line 560
    iput v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    .line 561
    new-instance v5, Landroid/os/WorkSource;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 562
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/os/WorkSource;-><init>(ILjava/lang/String;)V

    iput-object v5, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    .line 566
    invoke-direct {p0, v1}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v1

    .line 568
    .local v1, "proxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "MwiRIL: proxy = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v1, :cond_0

    move v0, v4

    :cond_0
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 570
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/wfo/ril/MwiRIL;I)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/wfo/ril/MwiRIL;
    .param p1, "x1"    # I

    .line 242
    invoke-direct {p0, p1}, Lcom/mediatek/wfo/ril/MwiRIL;->clearWakeLock(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/mediatek/wfo/ril/MwiRIL;I)Lcom/mediatek/wfo/ril/RILRequest;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/wfo/ril/MwiRIL;
    .param p1, "x1"    # I

    .line 242
    invoke-direct {p0, p1}, Lcom/mediatek/wfo/ril/MwiRIL;->findAndRemoveRequestFromList(I)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/wfo/ril/RILRequest;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/wfo/ril/RILRequest;

    .line 242
    invoke-static {p0}, Lcom/mediatek/wfo/ril/MwiRIL;->getResponseForTimedOutRILRequest(Lcom/mediatek/wfo/ril/RILRequest;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/wfo/ril/MwiRIL;)Lcom/android/internal/telephony/metrics/TelephonyMetrics;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/wfo/ril/MwiRIL;

    .line 242
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mMetrics:Lcom/android/internal/telephony/metrics/TelephonyMetrics;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/wfo/ril/MwiRIL;Lcom/mediatek/wfo/ril/RILRequest;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/wfo/ril/MwiRIL;
    .param p1, "x1"    # Lcom/mediatek/wfo/ril/RILRequest;

    .line 242
    invoke-direct {p0, p1}, Lcom/mediatek/wfo/ril/MwiRIL;->decrementWakeLock(Lcom/mediatek/wfo/ril/RILRequest;)V

    return-void
.end method

.method static synthetic access$500(Lcom/mediatek/wfo/ril/MwiRIL;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/wfo/ril/MwiRIL;

    .line 242
    invoke-direct {p0}, Lcom/mediatek/wfo/ril/MwiRIL;->resetProxyAndRequestList()V

    return-void
.end method

.method static synthetic access$600(Lcom/mediatek/wfo/ril/MwiRIL;Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/wfo/ril/MwiRIL;
    .param p1, "x1"    # Landroid/os/Message;

    .line 242
    invoke-direct {p0, p1}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v0

    return-object v0
.end method

.method private acquireWakeLock(Lcom/mediatek/wfo/ril/RILRequest;I)V
    .locals 7
    .param p1, "rr"    # Lcom/mediatek/wfo/ril/RILRequest;
    .param p2, "wakeLockType"    # I

    .line 1070
    monitor-enter p1

    .line 1071
    :try_start_0
    iget v0, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWakeLockType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 1072
    const-string v0, "MwiRIL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to aquire wakelock for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1073
    monitor-exit p1

    return-void

    .line 1076
    :cond_0
    const/4 v0, 0x1

    if-eqz p2, :cond_2

    if-eq p2, v0, :cond_1

    .line 1112
    const-string v0, "MwiRIL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Acquiring Invalid Wakelock type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1113
    monitor-exit p1

    return-void

    .line 1102
    :cond_1
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 1103
    :try_start_1
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 1104
    iget v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWlSequenceNum:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWlSequenceNum:I

    .line 1106
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRilHandler:Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1107
    .local v0, "msg":Landroid/os/Message;
    iget v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWlSequenceNum:I

    iput v2, v0, Landroid/os/Message;->arg1:I

    .line 1108
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRilHandler:Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;

    iget v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWakeLockTimeout:I

    int-to-long v3, v3

    invoke-virtual {v2, v0, v3, v4}, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1109
    nop

    .end local v0    # "msg":Landroid/os/Message;
    monitor-exit v1

    .line 1110
    goto :goto_1

    .line 1109
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local p0    # "this":Lcom/mediatek/wfo/ril/MwiRIL;
    .end local p1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .end local p2    # "wakeLockType":I
    :try_start_2
    throw v0

    .line 1078
    .restart local p0    # "this":Lcom/mediatek/wfo/ril/MwiRIL;
    .restart local p1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .restart local p2    # "wakeLockType":I
    :cond_2
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 1079
    :try_start_3
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 1080
    iget v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    .line 1081
    iget v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWlSequenceNum:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWlSequenceNum:I

    .line 1083
    iget-object v0, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWorkSource:Landroid/os/WorkSource;

    invoke-direct {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->getWorkSourceClientId(Landroid/os/WorkSource;)Ljava/lang/String;

    move-result-object v0

    .line 1084
    .local v0, "clientId":Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mClientWakelockTracker:Lcom/android/internal/telephony/ClientWakelockTracker;

    invoke-virtual {v2, v0}, Lcom/android/internal/telephony/ClientWakelockTracker;->isClientActive(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 1085
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    if-eqz v2, :cond_3

    .line 1086
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    iget-object v3, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWorkSource:Landroid/os/WorkSource;

    invoke-virtual {v2, v3}, Landroid/os/WorkSource;->add(Landroid/os/WorkSource;)Z

    goto :goto_0

    .line 1088
    :cond_3
    iget-object v2, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWorkSource:Landroid/os/WorkSource;

    iput-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    .line 1090
    :goto_0
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    iget-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    invoke-virtual {v2, v3}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 1093
    :cond_4
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mClientWakelockTracker:Lcom/android/internal/telephony/ClientWakelockTracker;

    iget-object v3, p1, Lcom/mediatek/wfo/ril/RILRequest;->mClientId:Ljava/lang/String;

    iget v4, p1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    iget v5, p1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    iget v6, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/android/internal/telephony/ClientWakelockTracker;->startTracking(Ljava/lang/String;III)V

    .line 1096
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRilHandler:Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 1097
    .local v2, "msg":Landroid/os/Message;
    iget v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWlSequenceNum:I

    iput v3, v2, Landroid/os/Message;->arg1:I

    .line 1098
    iget-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRilHandler:Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;

    iget v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockTimeout:I

    int-to-long v4, v4

    invoke-virtual {v3, v2, v4, v5}, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1099
    nop

    .end local v0    # "clientId":Ljava/lang/String;
    .end local v2    # "msg":Landroid/os/Message;
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1100
    nop

    .line 1115
    :goto_1
    :try_start_4
    iput p2, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWakeLockType:I

    .line 1116
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1117
    return-void

    .line 1099
    :catchall_1
    move-exception v0

    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .end local p0    # "this":Lcom/mediatek/wfo/ril/MwiRIL;
    .end local p1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .end local p2    # "wakeLockType":I
    :try_start_6
    throw v0

    .line 1116
    .restart local p0    # "this":Lcom/mediatek/wfo/ril/MwiRIL;
    .restart local p1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .restart local p2    # "wakeLockType":I
    :catchall_2
    move-exception v0

    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw v0
.end method

.method private addRequest(Lcom/mediatek/wfo/ril/RILRequest;)V
    .locals 3
    .param p1, "rr"    # Lcom/mediatek/wfo/ril/RILRequest;

    .line 573
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->acquireWakeLock(Lcom/mediatek/wfo/ril/RILRequest;I)V

    .line 574
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    monitor-enter v0

    .line 575
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, p1, Lcom/mediatek/wfo/ril/RILRequest;->mStartTimeMs:J

    .line 576
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    iget v2, p1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    invoke-virtual {v1, v2, p1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 577
    monitor-exit v0

    .line 578
    return-void

    .line 577
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private addToRilHistogram(Lcom/mediatek/wfo/ril/RILRequest;)V
    .locals 9
    .param p1, "rr"    # Lcom/mediatek/wfo/ril/RILRequest;

    .line 1219
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 1220
    .local v0, "endTime":J
    iget-wide v2, p1, Lcom/mediatek/wfo/ril/RILRequest;->mStartTimeMs:J

    sub-long v2, v0, v2

    long-to-int v2, v2

    .line 1222
    .local v2, "totalTime":I
    sget-object v3, Lcom/mediatek/wfo/ril/MwiRIL;->mRilTimeHistograms:Landroid/util/SparseArray;

    monitor-enter v3

    .line 1223
    :try_start_0
    sget-object v4, Lcom/mediatek/wfo/ril/MwiRIL;->mRilTimeHistograms:Landroid/util/SparseArray;

    iget v5, p1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-virtual {v4, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyHistogram;

    .line 1224
    .local v4, "entry":Landroid/telephony/TelephonyHistogram;
    if-nez v4, :cond_0

    .line 1226
    new-instance v5, Landroid/telephony/TelephonyHistogram;

    const/4 v6, 0x1

    iget v7, p1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    const/4 v8, 0x5

    invoke-direct {v5, v6, v7, v8}, Landroid/telephony/TelephonyHistogram;-><init>(III)V

    move-object v4, v5

    .line 1228
    sget-object v5, Lcom/mediatek/wfo/ril/MwiRIL;->mRilTimeHistograms:Landroid/util/SparseArray;

    iget v6, p1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-virtual {v5, v6, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1230
    :cond_0
    invoke-virtual {v4, v2}, Landroid/telephony/TelephonyHistogram;->addTimeTaken(I)V

    .line 1231
    .end local v4    # "entry":Landroid/telephony/TelephonyHistogram;
    monitor-exit v3

    .line 1232
    return-void

    .line 1231
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method private clearRequestList(IZ)V
    .locals 7
    .param p1, "error"    # I
    .param p2, "loggable"    # Z

    .line 1185
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    monitor-enter v0

    .line 1186
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    .line 1187
    .local v1, "count":I
    if-eqz p2, :cond_0

    .line 1188
    const-string v2, "MwiRIL"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "clearRequestList  mWakeLockCount="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " mRequestList="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1192
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 1193
    iget-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/wfo/ril/RILRequest;

    .line 1194
    .local v3, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    if-eqz p2, :cond_1

    .line 1195
    const-string v4, "MwiRIL"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ": ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v3, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "] "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v3, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    .line 1196
    invoke-static {v6}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1195
    invoke-static {v4, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1198
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Lcom/mediatek/wfo/ril/RILRequest;->onError(ILjava/lang/Object;)V

    .line 1199
    invoke-direct {p0, v3}, Lcom/mediatek/wfo/ril/MwiRIL;->decrementWakeLock(Lcom/mediatek/wfo/ril/RILRequest;)V

    .line 1200
    invoke-virtual {v3}, Lcom/mediatek/wfo/ril/RILRequest;->release()V

    .line 1192
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1202
    .end local v2    # "i":I
    .end local v3    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :cond_2
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 1203
    .end local v1    # "count":I
    monitor-exit v0

    .line 1204
    return-void

    .line 1203
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private clearWakeLock(I)Z
    .locals 6
    .param p1, "wakeLockType"    # I

    .line 1158
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_1

    .line 1159
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v2

    .line 1160
    :try_start_0
    iget v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v3

    if-nez v3, :cond_0

    monitor-exit v2

    return v1

    .line 1161
    :cond_0
    const-string v3, "MwiRIL"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NOTE: mWakeLockCount is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "at time of clearing"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1163
    iput v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    .line 1164
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1165
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mClientWakelockTracker:Lcom/android/internal/telephony/ClientWakelockTracker;

    invoke-virtual {v1}, Lcom/android/internal/telephony/ClientWakelockTracker;->stopTrackingAll()V

    .line 1166
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    .line 1167
    monitor-exit v2

    return v0

    .line 1168
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1170
    :cond_1
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v2

    .line 1171
    :try_start_1
    iget-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v3

    if-nez v3, :cond_2

    monitor-exit v2

    return v1

    .line 1172
    :cond_2
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mAckWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1173
    monitor-exit v2

    return v0

    .line 1174
    :catchall_1
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0
.end method

.method private decrementWakeLock(Lcom/mediatek/wfo/ril/RILRequest;)V
    .locals 9
    .param p1, "rr"    # Lcom/mediatek/wfo/ril/RILRequest;

    .line 1120
    monitor-enter p1

    .line 1121
    :try_start_0
    iget v0, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWakeLockType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    if-eq v0, v2, :cond_0

    .line 1151
    const-string v0, "MwiRIL"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Decrementing Invalid Wakelock type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWakeLockType:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 1147
    :cond_0
    goto :goto_2

    .line 1123
    :cond_1
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1124
    :try_start_1
    iget-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mClientWakelockTracker:Lcom/android/internal/telephony/ClientWakelockTracker;

    iget-object v4, p1, Lcom/mediatek/wfo/ril/RILRequest;->mClientId:Ljava/lang/String;

    iget v5, p1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    iget v6, p1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    .line 1126
    iget v7, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    const/4 v8, 0x0

    if-le v7, v2, :cond_2

    iget v7, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    sub-int/2addr v7, v2

    goto :goto_0

    :cond_2
    move v7, v8

    .line 1124
    :goto_0
    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/android/internal/telephony/ClientWakelockTracker;->stopTracking(Ljava/lang/String;III)V

    .line 1127
    iget-object v3, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWorkSource:Landroid/os/WorkSource;

    invoke-direct {p0, v3}, Lcom/mediatek/wfo/ril/MwiRIL;->getWorkSourceClientId(Landroid/os/WorkSource;)Ljava/lang/String;

    move-result-object v3

    .line 1128
    .local v3, "clientId":Ljava/lang/String;
    iget-object v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mClientWakelockTracker:Lcom/android/internal/telephony/ClientWakelockTracker;

    invoke-virtual {v4, v3}, Lcom/android/internal/telephony/ClientWakelockTracker;->isClientActive(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    iget-object v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    if-eqz v4, :cond_4

    .line 1130
    iget-object v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    iget-object v5, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWorkSource:Landroid/os/WorkSource;

    invoke-virtual {v4, v5}, Landroid/os/WorkSource;->remove(Landroid/os/WorkSource;)Z

    .line 1131
    iget-object v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    invoke-virtual {v4}, Landroid/os/WorkSource;->size()I

    move-result v4

    if-nez v4, :cond_3

    .line 1132
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    .line 1134
    :cond_3
    iget-object v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    iget-object v5, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mActiveWakelockWorkSource:Landroid/os/WorkSource;

    invoke-virtual {v4, v5}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 1137
    :cond_4
    iget v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    if-le v4, v2, :cond_5

    .line 1138
    iget v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    sub-int/2addr v4, v2

    iput v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    goto :goto_1

    .line 1140
    :cond_5
    iput v8, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLockCount:I

    .line 1141
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1143
    .end local v3    # "clientId":Ljava/lang/String;
    :goto_1
    monitor-exit v0

    .line 1144
    goto :goto_2

    .line 1143
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local p0    # "this":Lcom/mediatek/wfo/ril/MwiRIL;
    .end local p1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :try_start_2
    throw v1

    .line 1149
    .restart local p0    # "this":Lcom/mediatek/wfo/ril/MwiRIL;
    .restart local p1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :cond_6
    nop

    .line 1153
    :goto_2
    iput v1, p1, Lcom/mediatek/wfo/ril/RILRequest;->mWakeLockType:I

    .line 1154
    monitor-exit p1

    .line 1155
    return-void

    .line 1154
    :catchall_1
    move-exception v0

    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method private findAndRemoveRequestFromList(I)Lcom/mediatek/wfo/ril/RILRequest;
    .locals 3
    .param p1, "serial"    # I

    .line 1207
    const/4 v0, 0x0

    .line 1208
    .local v0, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    monitor-enter v1

    .line 1209
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/wfo/ril/RILRequest;

    move-object v0, v2

    .line 1210
    if-eqz v0, :cond_0

    .line 1211
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 1213
    :cond_0
    monitor-exit v1

    .line 1215
    return-object v0

    .line 1213
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private getDeafultWorkSourceIfInvalid(Landroid/os/WorkSource;)Landroid/os/WorkSource;
    .locals 0
    .param p1, "workSource"    # Landroid/os/WorkSource;

    .line 1045
    if-nez p1, :cond_0

    .line 1046
    iget-object p1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    .line 1049
    :cond_0
    return-object p1
.end method

.method private getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    .locals 5
    .param p1, "result"    # Landroid/os/Message;

    .line 487
    iget-boolean v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mIsMobileNetworkSupported:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 489
    return-object v1

    .line 492
    :cond_0
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    if-eqz v0, :cond_1

    .line 493
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    return-object v0

    .line 497
    :cond_1
    :try_start_0
    sget-object v0, Lcom/mediatek/wfo/ril/MwiRIL;->IMS_HIDL_SERVICE_NAME:[Ljava/lang/String;

    .line 498
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    if-nez v2, :cond_2

    const/4 v2, 0x0

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    :goto_0
    aget-object v0, v0, v2

    .line 497
    invoke-static {v0}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->getService(Ljava/lang/String;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    .line 499
    const-string v0, "mRadioProxy getService() done"

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLoge(Ljava/lang/String;)V

    .line 500
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    if-eqz v0, :cond_3

    .line 501
    const-string v0, "mRadioProxy getService() done 2"

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLoge(Ljava/lang/String;)V

    .line 502
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxyDeathRecipient:Lcom/mediatek/wfo/ril/MwiRIL$RadioProxyDeathRecipient;

    iget-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxyCookie:Ljava/util/concurrent/atomic/AtomicLong;

    .line 503
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v3

    .line 502
    invoke-interface {v0, v2, v3, v4}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->linkToDeath(Landroid/os/IHwBinder$DeathRecipient;J)Z

    .line 504
    const-string v0, "mRadioProxy linkToDeath() done"

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLoge(Ljava/lang/String;)V

    .line 506
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioResponse:Lcom/mediatek/wfo/ril/MwiRadioResponse;

    iget-object v3, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioIndication:Lcom/mediatek/wfo/ril/MwiRadioIndication;

    invoke-interface {v0, v2, v3}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setResponseFunctionsMwi(Lvendor/mediatek/hardware/mtkradioex/V2_0/IMwiRadioResponse;Lvendor/mediatek/hardware/mtkradioex/V2_0/IMwiRadioIndication;)V

    .line 507
    const-string v0, "mRadioProxy setResponseFunctionsMwi() done"

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLoge(Ljava/lang/String;)V

    goto :goto_1

    .line 510
    :cond_3
    const-string v0, "getRadioProxy: mRadioProxy == null"

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLoge(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 515
    :goto_1
    goto :goto_2

    .line 512
    :catch_0
    move-exception v0

    .line 513
    .local v0, "e":Ljava/lang/Exception;
    iput-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    .line 514
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RadioProxy getService/setResponseFunctions: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLoge(Ljava/lang/String;)V

    .line 517
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    if-nez v0, :cond_5

    .line 518
    if-eqz p1, :cond_4

    .line 519
    const/4 v0, 0x1

    .line 520
    invoke-static {v0}, Lcom/android/internal/telephony/CommandException;->fromRilErrno(I)Lcom/android/internal/telephony/CommandException;

    move-result-object v0

    .line 519
    invoke-static {p1, v1, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 521
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 525
    :cond_4
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRilHandler:Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxyCookie:Ljava/util/concurrent/atomic/AtomicLong;

    .line 527
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 526
    invoke-virtual {v0, v1, v2}, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0xfa0

    .line 525
    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 531
    :cond_5
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    return-object v0
.end method

.method private static getResponseForTimedOutRILRequest(Lcom/mediatek/wfo/ril/RILRequest;)Ljava/lang/Object;
    .locals 1
    .param p0, "rr"    # Lcom/mediatek/wfo/ril/RILRequest;

    .line 442
    if-nez p0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 444
    :cond_0
    const/4 v0, 0x0

    .line 453
    .local v0, "timeoutResponse":Ljava/lang/Object;
    return-object v0
.end method

.method public static getTelephonyRILTimingHistograms()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/telephony/TelephonyHistogram;",
            ">;"
        }
    .end annotation

    .line 339
    sget-object v0, Lcom/mediatek/wfo/ril/MwiRIL;->mRilTimeHistograms:Landroid/util/SparseArray;

    monitor-enter v0

    .line 340
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lcom/mediatek/wfo/ril/MwiRIL;->mRilTimeHistograms:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 341
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/TelephonyHistogram;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    sget-object v3, Lcom/mediatek/wfo/ril/MwiRIL;->mRilTimeHistograms:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 342
    new-instance v3, Landroid/telephony/TelephonyHistogram;

    sget-object v4, Lcom/mediatek/wfo/ril/MwiRIL;->mRilTimeHistograms:Landroid/util/SparseArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyHistogram;

    invoke-direct {v3, v4}, Landroid/telephony/TelephonyHistogram;-><init>(Landroid/telephony/TelephonyHistogram;)V

    .line 343
    .local v3, "entry":Landroid/telephony/TelephonyHistogram;
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 341
    nop

    .end local v3    # "entry":Landroid/telephony/TelephonyHistogram;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 345
    .end local v2    # "i":I
    :cond_0
    monitor-exit v0

    .line 346
    return-object v1

    .line 345
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/TelephonyHistogram;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getWorkSourceClientId(Landroid/os/WorkSource;)Ljava/lang/String;
    .locals 3
    .param p1, "workSource"    # Landroid/os/WorkSource;

    .line 1053
    if-eqz p1, :cond_0

    .line 1054
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/os/WorkSource;->get(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Landroid/os/WorkSource;->getName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1057
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 4
    .param p1, "rr"    # Lcom/mediatek/wfo/ril/RILRequest;
    .param p2, "caller"    # Ljava/lang/String;
    .param p3, "e"    # Ljava/lang/Exception;

    .line 587
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLoge(Ljava/lang/String;)V

    .line 588
    invoke-direct {p0}, Lcom/mediatek/wfo/ril/MwiRIL;->resetProxyAndRequestList()V

    .line 592
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRilHandler:Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;

    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxyCookie:Ljava/util/concurrent/atomic/AtomicLong;

    .line 594
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 593
    const/4 v2, 0x6

    invoke-virtual {v0, v2, v1}, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 592
    const-wide/16 v2, 0xfa0

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/wfo/ril/MwiRIL$RilHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 596
    return-void
.end method

.method private obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;
    .locals 1
    .param p1, "request"    # I
    .param p2, "result"    # Landroid/os/Message;
    .param p3, "workSource"    # Landroid/os/WorkSource;

    .line 581
    invoke-static {p1, p2, p3}, Lcom/mediatek/wfo/ril/RILRequest;->obtain(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v0

    .line 582
    .local v0, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    invoke-direct {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->addRequest(Lcom/mediatek/wfo/ril/RILRequest;)V

    .line 583
    return-object v0
.end method

.method static requestToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "request"    # I

    .line 1264
    const/16 v0, 0x853

    if-eq p0, v0, :cond_3

    const/16 v0, 0x854

    if-eq p0, v0, :cond_2

    const/16 v0, 0x883

    if-eq p0, v0, :cond_1

    const/16 v0, 0x88b

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    .line 1286
    const-string v0, "<unknown request>"

    return-object v0

    .line 1276
    :pswitch_0
    const-string v0, "MwiRILConstants.RIL_REQUEST_SET_EMERGENCY_ADDRESS_ID"

    return-object v0

    .line 1274
    :pswitch_1
    const-string v0, "MwiRILConstants.RIL_REQUEST_SET_GEO_LOCATION"

    return-object v0

    .line 1272
    :pswitch_2
    const-string v0, "MwiRILConstants.RIL_REQUEST_SET_WIFI_IP_ADDRESS"

    return-object v0

    .line 1270
    :pswitch_3
    const-string v0, "MwiRILConstants.RIL_REQUEST_SET_WIFI_SIGNAL_LEVEL"

    return-object v0

    .line 1268
    :pswitch_4
    const-string v0, "MwiRILConstants.RIL_REQUEST_SET_WIFI_ASSOCIATED"

    return-object v0

    .line 1266
    :pswitch_5
    const-string v0, "MwiRILConstants.RIL_REQUEST_SET_WIFI_ENABLED"

    return-object v0

    .line 1285
    :cond_0
    const-string v0, "MwiRILConstants.RIL_REQUEST_SET_WFC_CONFIG"

    return-object v0

    .line 1283
    :cond_1
    const-string v0, "MwiRILConstants.RIL_REQUEST_NOTIFY_EPDG_SCREEN_STATE"

    return-object v0

    .line 1280
    :cond_2
    const-string v0, "MwiRILConstants.RIL_REQUEST_SET_WIFI_PING_RESULT"

    return-object v0

    .line 1278
    :cond_3
    const-string v0, "MwiRILConstants.RIL_REQUEST_SET_NATT_KEEPALIVE_STATUS"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x844
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private resetProxyAndRequestList()V
    .locals 2

    .line 470
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxy:Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    .line 473
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRadioProxyCookie:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 477
    invoke-static {}, Lcom/mediatek/wfo/ril/RILRequest;->resetSerial()V

    .line 479
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/mediatek/wfo/ril/MwiRIL;->clearRequestList(IZ)V

    .line 484
    return-void
.end method

.method static responseToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "request"    # I

    .line 1236
    const/16 v0, 0xc37

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    .line 1259
    const-string v0, "<unknown response>"

    return-object v0

    .line 1256
    :pswitch_0
    const-string v0, "MwiRILConstants.RIL_UNSOL_WIFI_PDN_OOS"

    return-object v0

    .line 1254
    :pswitch_1
    const-string v0, "MwiRILConstants.RIL_UNSOL_WIFI_PING_REQUEST"

    return-object v0

    .line 1252
    :pswitch_2
    const-string v0, "MwiRILConstants.RIL_UNSOL_NATT_KEEP_ALIVE_CHANGED"

    return-object v0

    .line 1250
    :pswitch_3
    const-string v0, "MwiRILConstants.RIL_UNSOL_WFC_PDN_STATE"

    return-object v0

    .line 1248
    :pswitch_4
    const-string v0, "MwiRILConstants.RIL_UNSOL_REQUEST_GEO_LOCATION"

    return-object v0

    .line 1246
    :pswitch_5
    const-string v0, "MwiRILConstants.RIL_UNSOL_WIFI_PDN_ERROR"

    return-object v0

    .line 1244
    :pswitch_6
    const-string v0, "MwiRILConstants.RIL_UNSOL_WIFI_RSSI_MONITORING_CONFIG"

    return-object v0

    .line 1242
    :pswitch_7
    const-string v0, "MwiRILConstants.RIL_UNSOL_ACTIVE_WIFI_PDN_COUNT"

    return-object v0

    .line 1240
    :pswitch_8
    const-string v0, "MwiRILConstants.RIL_UNSOL_MOBILE_WIFI_HANDOVER"

    return-object v0

    .line 1238
    :pswitch_9
    const-string v0, "MwiRILConstants.RIL_UNSOL_MOBILE_WIFI_ROVEOUT"

    return-object v0

    .line 1258
    :cond_0
    const-string v0, "MwiRILConstants.RIL_UNSOL_WIFI_LOCK"

    return-object v0

    :pswitch_data_0
    .packed-switch 0xc03
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc0e
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static retToString(ILjava/lang/Object;)Ljava/lang/String;
    .locals 7
    .param p0, "req"    # I
    .param p1, "ret"    # Ljava/lang/Object;

    .line 1291
    if-nez p1, :cond_0

    const-string v0, ""

    return-object v0

    .line 1296
    :cond_0
    instance-of v0, p1, [I

    const-string v1, ", "

    const-string v2, "}"

    const-string v3, "{"

    if-eqz v0, :cond_2

    .line 1297
    move-object v0, p1

    check-cast v0, [I

    .line 1298
    .local v0, "intArray":[I
    array-length v4, v0

    .line 1299
    .local v4, "length":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v3, v5

    .line 1300
    .local v3, "sb":Ljava/lang/StringBuilder;
    if-lez v4, :cond_1

    .line 1301
    const/4 v5, 0x0

    .line 1302
    .local v5, "i":I
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "i":I
    .local v6, "i":I
    aget v5, v0, v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1303
    :goto_0
    if-ge v6, v4, :cond_1

    .line 1304
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    aget v6, v0, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move v6, v5

    goto :goto_0

    .line 1307
    .end local v5    # "i":I
    :cond_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1308
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1309
    .local v0, "s":Ljava/lang/String;
    goto :goto_2

    .end local v0    # "s":Ljava/lang/String;
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    .end local v4    # "length":I
    :cond_2
    instance-of v0, p1, [Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 1310
    move-object v0, p1

    check-cast v0, [Ljava/lang/String;

    .line 1311
    .local v0, "strings":[Ljava/lang/String;
    array-length v4, v0

    .line 1312
    .restart local v4    # "length":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v3, v5

    .line 1313
    .restart local v3    # "sb":Ljava/lang/StringBuilder;
    if-lez v4, :cond_3

    .line 1314
    const/4 v5, 0x0

    .line 1315
    .restart local v5    # "i":I
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "i":I
    .restart local v6    # "i":I
    aget-object v5, v0, v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1316
    :goto_1
    if-ge v6, v4, :cond_3

    .line 1317
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    aget-object v6, v0, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v6, v5

    goto :goto_1

    .line 1320
    .end local v5    # "i":I
    :cond_3
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1321
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1322
    .local v0, "s":Ljava/lang/String;
    goto :goto_2

    .line 1323
    .end local v0    # "s":Ljava/lang/String;
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    .end local v4    # "length":I
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1325
    .restart local v0    # "s":Ljava/lang/String;
    :goto_2
    return-object v0
.end method

.method private sendAck()V
    .locals 5

    .line 1027
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    const/16 v1, 0x320

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Lcom/mediatek/wfo/ril/RILRequest;->obtain(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v0

    .line 1029
    .local v0, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/mediatek/wfo/ril/MwiRIL;->acquireWakeLock(Lcom/mediatek/wfo/ril/RILRequest;I)V

    .line 1030
    invoke-direct {p0, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v1

    .line 1031
    .local v1, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v1, :cond_0

    .line 1033
    :try_start_0
    invoke-interface {v1}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->responseAcknowledgementMtk()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1037
    :goto_0
    goto :goto_1

    .line 1034
    :catch_0
    move-exception v2

    .line 1035
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "sendAck"

    invoke-direct {p0, v0, v3, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1036
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sendAck: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLoge(Ljava/lang/String;)V

    .end local v2    # "e":Ljava/lang/Exception;
    goto :goto_0

    .line 1039
    :cond_0
    const-string v2, "MwiRIL"

    const-string v3, "Error trying to send ack, radioProxy = null"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1041
    :goto_1
    invoke-virtual {v0}, Lcom/mediatek/wfo/ril/RILRequest;->release()V

    .line 1042
    return-void
.end method


# virtual methods
.method protected convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 605
    if-eqz p1, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public notifyEPDGScreenState(ILandroid/os/Message;)V
    .locals 4
    .param p1, "state"    # I
    .param p2, "response"    # Landroid/os/Message;

    .line 875
    invoke-direct {p0, p2}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v0

    .line 876
    .local v0, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v0, :cond_0

    .line 877
    const/16 v1, 0x883

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {p0, v1, p2, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v1

    .line 881
    .local v1, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 885
    :try_start_0
    iget v2, v1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    invoke-interface {v0, v2, p1}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->notifyEPDGScreenState(II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 888
    goto :goto_0

    .line 886
    :catch_0
    move-exception v2

    .line 887
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "notifyEPDGScreenState"

    invoke-direct {p0, v1, v3, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 890
    .end local v1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method processIndication(I)V
    .locals 1
    .param p1, "indicationType"    # I

    .line 900
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 901
    invoke-direct {p0}, Lcom/mediatek/wfo/ril/MwiRIL;->sendAck()V

    .line 902
    const-string v0, "Unsol response received; Sending ack to ril.cpp"

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 906
    :cond_0
    return-void
.end method

.method processRequestAck(I)V
    .locals 3
    .param p1, "serial"    # I

    .line 910
    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    monitor-enter v0

    .line 911
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/wfo/ril/RILRequest;

    .line 912
    .local v1, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 913
    if-nez v1, :cond_0

    .line 914
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processRequestAck: Unexpected solicited ack response! serial: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "MwiRIL"

    invoke-static {v2, v0}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 918
    :cond_0
    invoke-direct {p0, v1}, Lcom/mediatek/wfo/ril/MwiRIL;->decrementWakeLock(Lcom/mediatek/wfo/ril/RILRequest;)V

    .line 920
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " Ack < "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 923
    :goto_0
    return-void

    .line 912
    .end local v1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method processResponse(Landroid/hardware/radio/V1_0/RadioResponseInfo;)Lcom/mediatek/wfo/ril/RILRequest;
    .locals 6
    .param p1, "responseInfo"    # Landroid/hardware/radio/V1_0/RadioResponseInfo;

    .line 933
    iget v0, p1, Landroid/hardware/radio/V1_0/RadioResponseInfo;->serial:I

    .line 934
    .local v0, "serial":I
    iget v1, p1, Landroid/hardware/radio/V1_0/RadioResponseInfo;->error:I

    .line 935
    .local v1, "error":I
    iget v2, p1, Landroid/hardware/radio/V1_0/RadioResponseInfo;->type:I

    .line 937
    .local v2, "type":I
    const/4 v3, 0x0

    .line 939
    .local v3, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    const/4 v4, 0x1

    if-ne v2, v4, :cond_1

    .line 940
    iget-object v4, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    monitor-enter v4

    .line 941
    :try_start_0
    iget-object v5, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v5, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/wfo/ril/RILRequest;

    move-object v3, v5

    .line 942
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 943
    if-nez v3, :cond_0

    .line 944
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected solicited ack response! sn: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MwiRIL"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 946
    :cond_0
    invoke-direct {p0, v3}, Lcom/mediatek/wfo/ril/MwiRIL;->decrementWakeLock(Lcom/mediatek/wfo/ril/RILRequest;)V

    .line 948
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " Ack < "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v3, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v5}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 951
    :goto_0
    return-object v3

    .line 942
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 954
    :cond_1
    invoke-direct {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->findAndRemoveRequestFromList(I)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v3

    .line 955
    if-nez v3, :cond_2

    .line 956
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "processResponse: Unexpected response! serial: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MwiRIL"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 958
    const/4 v4, 0x0

    return-object v4

    .line 962
    :cond_2
    invoke-direct {p0, v3}, Lcom/mediatek/wfo/ril/MwiRIL;->addToRilHistogram(Lcom/mediatek/wfo/ril/RILRequest;)V

    .line 964
    const/4 v4, 0x2

    if-ne v2, v4, :cond_3

    .line 965
    invoke-direct {p0}, Lcom/mediatek/wfo/ril/MwiRIL;->sendAck()V

    .line 967
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Response received for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v3, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    .line 968
    invoke-static {v5}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " Sending ack to ril.cpp"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 967
    invoke-virtual {p0, v4}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 977
    :cond_3
    iget v4, v3, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    .line 982
    nop

    .line 987
    return-object v3
.end method

.method processResponseDone(Lcom/mediatek/wfo/ril/RILRequest;Landroid/hardware/radio/V1_0/RadioResponseInfo;Ljava/lang/Object;)V
    .locals 7
    .param p1, "rr"    # Lcom/mediatek/wfo/ril/RILRequest;
    .param p2, "responseInfo"    # Landroid/hardware/radio/V1_0/RadioResponseInfo;
    .param p3, "ret"    # Ljava/lang/Object;

    .line 999
    iget v0, p2, Landroid/hardware/radio/V1_0/RadioResponseInfo;->error:I

    const-string v1, "< "

    if-nez v0, :cond_0

    .line 1001
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v1}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    .line 1002
    invoke-static {v1, p3}, Lcom/mediatek/wfo/ril/MwiRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1001
    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_0

    .line 1006
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v1}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " error "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p2, Landroid/hardware/radio/V1_0/RadioResponseInfo;->error:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 1009
    iget v0, p2, Landroid/hardware/radio/V1_0/RadioResponseInfo;->error:I

    invoke-virtual {p1, v0, p3}, Lcom/mediatek/wfo/ril/RILRequest;->onError(ILjava/lang/Object;)V

    .line 1011
    :goto_0
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mMetrics:Lcom/android/internal/telephony/metrics/TelephonyMetrics;

    iget-object v0, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v3, p1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    iget v4, p2, Landroid/hardware/radio/V1_0/RadioResponseInfo;->error:I

    iget v5, p1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    move-object v6, p3

    invoke-virtual/range {v1 .. v6}, Lcom/android/internal/telephony/metrics/TelephonyMetrics;->writeOnRilSolicitedResponse(IIIILjava/lang/Object;)V

    .line 1013
    if-eqz p1, :cond_2

    .line 1014
    iget v0, p2, Landroid/hardware/radio/V1_0/RadioResponseInfo;->type:I

    if-nez v0, :cond_1

    .line 1015
    invoke-direct {p0, p1}, Lcom/mediatek/wfo/ril/MwiRIL;->decrementWakeLock(Lcom/mediatek/wfo/ril/RILRequest;)V

    .line 1017
    :cond_1
    invoke-virtual {p1}, Lcom/mediatek/wfo/ril/RILRequest;->release()V

    .line 1019
    :cond_2
    return-void
.end method

.method riljLog(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .line 1329
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1330
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " [SUB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1329
    const-string v1, "MwiRIL"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1331
    return-void
.end method

.method riljLoge(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .line 1334
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1335
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " [SUB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1334
    const-string v1, "MwiRIL"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1336
    return-void
.end method

.method riljLoge(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .line 1339
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1340
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " [SUB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1339
    const-string v1, "MwiRIL"

    invoke-static {v1, v0, p2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1341
    return-void
.end method

.method riljLogv(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .line 1344
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1345
    iget-object v1, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " [SUB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mPhoneId:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1344
    const-string v1, "MwiRIL"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1346
    return-void
.end method

.method public setEmergencyAddressId(Ljava/lang/String;Landroid/os/Message;)V
    .locals 4
    .param p1, "aid"    # Ljava/lang/String;
    .param p2, "response"    # Landroid/os/Message;

    .line 806
    invoke-direct {p0, p2}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v0

    .line 807
    .local v0, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v0, :cond_0

    .line 808
    const/16 v1, 0x849

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {p0, v1, p2, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v1

    .line 812
    .local v1, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " aid:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 816
    :try_start_0
    iget v2, v1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    invoke-interface {v0, v2, p1}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setEmergencyAddressId(ILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 819
    goto :goto_0

    .line 817
    :catch_0
    move-exception v2

    .line 818
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "setEmergencyAddressId"

    invoke-direct {p0, v1, v3, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 821
    .end local v1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public setLocationInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 23
    .param p1, "accountId"    # Ljava/lang/String;
    .param p2, "broadcastFlag"    # Ljava/lang/String;
    .param p3, "latitude"    # Ljava/lang/String;
    .param p4, "longitude"    # Ljava/lang/String;
    .param p5, "accuracy"    # Ljava/lang/String;
    .param p6, "method"    # Ljava/lang/String;
    .param p7, "city"    # Ljava/lang/String;
    .param p8, "state"    # Ljava/lang/String;
    .param p9, "zip"    # Ljava/lang/String;
    .param p10, "countryCode"    # Ljava/lang/String;
    .param p11, "ueWlanMac"    # Ljava/lang/String;
    .param p12, "response"    # Landroid/os/Message;

    .line 771
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p12

    invoke-direct {v1, v5}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v19

    .line 772
    .local v19, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v19, :cond_0

    .line 773
    const/16 v0, 0x848

    iget-object v6, v1, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {v1, v0, v5, v6}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v15

    .line 777
    .local v15, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "> "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v15, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v6}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " accountId:"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v14, p1

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " broadcastFlag:"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " accuracy:"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " method:"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 786
    :try_start_0
    iget v7, v15, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    .line 787
    invoke-virtual/range {p0 .. p1}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 788
    invoke-virtual {v1, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 789
    move-object/from16 v13, p3

    invoke-virtual {v1, v13}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 790
    move-object/from16 v12, p4

    invoke-virtual {v1, v12}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 791
    invoke-virtual {v1, v3}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 792
    invoke-virtual {v1, v4}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 793
    move-object/from16 v6, p7

    invoke-virtual {v1, v6}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 794
    move-object/from16 v2, p8

    invoke-virtual {v1, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 795
    move-object/from16 v2, p9

    invoke-virtual {v1, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 796
    move-object/from16 v2, p10

    invoke-virtual {v1, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 797
    move-object/from16 v2, p11

    invoke-virtual {v1, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->convertNullToEmptyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 786
    move-object/from16 v6, v19

    move-object v12, v0

    move-object/from16 v13, v16

    move-object/from16 v14, v17

    move-object v2, v15

    .end local v15    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .local v2, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    move-object/from16 v15, v18

    move-object/from16 v16, v20

    move-object/from16 v17, v21

    move-object/from16 v18, v22

    :try_start_1
    invoke-interface/range {v6 .. v18}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setLocationInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 800
    goto :goto_1

    .line 798
    :catch_0
    move-exception v0

    goto :goto_0

    .end local v2    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .restart local v15    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :catch_1
    move-exception v0

    move-object v2, v15

    .line 799
    .end local v15    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v2    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :goto_0
    const-string v6, "setLocationInfo"

    invoke-direct {v1, v2, v6, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 802
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :cond_0
    :goto_1
    return-void
.end method

.method public setNattKeepAliveStatus(Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;ILandroid/os/Message;)V
    .locals 15
    .param p1, "ifName"    # Ljava/lang/String;
    .param p2, "enable"    # Z
    .param p3, "srcIp"    # Ljava/lang/String;
    .param p4, "srcPort"    # I
    .param p5, "dstIp"    # Ljava/lang/String;
    .param p6, "dstPort"    # I
    .param p7, "response"    # Landroid/os/Message;

    .line 827
    move-object v1, p0

    move-object/from16 v2, p7

    invoke-direct {p0, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v11

    .line 828
    .local v11, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v11, :cond_0

    .line 829
    const/16 v0, 0x853

    iget-object v3, v1, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {p0, v0, v2, v3}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v12

    .line 833
    .local v12, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "> "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v12, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ifName:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v13, p1

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " enable:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v14, p2

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 838
    :try_start_0
    iget v4, v12, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    move-object v3, v11

    move-object/from16 v5, p1

    move/from16 v6, p2

    move-object/from16 v7, p3

    move/from16 v8, p4

    move-object/from16 v9, p5

    move/from16 v10, p6

    invoke-interface/range {v3 .. v10}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setNattKeepAliveStatus(ILjava/lang/String;ZLjava/lang/String;ILjava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 842
    goto :goto_0

    .line 840
    :catch_0
    move-exception v0

    .line 841
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "setNattKeepAliveStatus"

    invoke-direct {p0, v12, v3, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 828
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v12    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :cond_0
    move-object/from16 v13, p1

    move/from16 v14, p2

    .line 844
    :goto_0
    return-void
.end method

.method public setWfcConfig(ILjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 4
    .param p1, "setting"    # I
    .param p2, "ifName"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "response"    # Landroid/os/Message;

    .line 741
    invoke-direct {p0, p4}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v0

    .line 742
    .local v0, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v0, :cond_0

    .line 743
    const/16 v1, 0x88b

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {p0, v1, p4, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v1

    .line 747
    .local v1, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " setting:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " ifName:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " value:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 754
    :try_start_0
    iget v2, v1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    invoke-interface {v0, v2, p1, p2, p3}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setWfcConfig(IILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 758
    goto :goto_0

    .line 756
    :catch_0
    move-exception v2

    .line 757
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "setWfcConfig"

    invoke-direct {p0, v1, v3, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 760
    .end local v1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public setWfcConfig_WifiUeMac(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 1
    .param p1, "ifName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "response"    # Landroid/os/Message;

    .line 764
    sget-object v0, Lcom/mediatek/wfo/ril/MwiRIL$WfcConfigType;->WFC_SETTING_WIFI_UEMAC:Lcom/mediatek/wfo/ril/MwiRIL$WfcConfigType;

    invoke-virtual {v0}, Lcom/mediatek/wfo/ril/MwiRIL$WfcConfigType;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/mediatek/wfo/ril/MwiRIL;->setWfcConfig(ILjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 765
    return-void
.end method

.method public setWifiAssociated(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/os/Message;)V
    .locals 16
    .param p1, "ifName"    # Ljava/lang/String;
    .param p2, "associated"    # Z
    .param p3, "ssid"    # Ljava/lang/String;
    .param p4, "apMac"    # Ljava/lang/String;
    .param p5, "mtuSize"    # I
    .param p6, "ueMac"    # Ljava/lang/String;
    .param p7, "response"    # Landroid/os/Message;

    .line 668
    move-object/from16 v1, p0

    move/from16 v2, p2

    move-object/from16 v3, p7

    invoke-direct {v1, v3}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v12

    .line 669
    .local v12, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v12, :cond_1

    .line 670
    const/16 v0, 0x845

    iget-object v4, v1, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {v1, v0, v3, v4}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v13

    .line 674
    .local v13, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "> "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v13, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v4}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " ifName:"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v14, p1

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " associated:"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ", mtu: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v15, p5

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 679
    :try_start_0
    iget v5, v13, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    .line 680
    if-eqz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move v7, v0

    .line 679
    move-object v4, v12

    move-object/from16 v6, p1

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move/from16 v10, p5

    move-object/from16 v11, p6

    invoke-interface/range {v4 .. v11}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setWifiAssociated(ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 683
    goto :goto_1

    .line 681
    :catch_0
    move-exception v0

    .line 682
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "setWifiAssociatedWithMtu"

    invoke-direct {v1, v13, v4, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 669
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v13    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :cond_1
    move-object/from16 v14, p1

    move/from16 v15, p5

    .line 685
    :goto_1
    return-void
.end method

.method public setWifiEnabled(Ljava/lang/String;IILandroid/os/Message;)V
    .locals 4
    .param p1, "ifName"    # Ljava/lang/String;
    .param p2, "isWifiEnabled"    # I
    .param p3, "isFlightModeOn"    # I
    .param p4, "response"    # Landroid/os/Message;

    .line 645
    invoke-direct {p0, p4}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v0

    .line 646
    .local v0, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v0, :cond_0

    .line 647
    const/16 v1, 0x844

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {p0, v1, p4, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v1

    .line 651
    .local v1, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ifName:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " isWifiEnabled:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " isFlightModeOn:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 657
    :try_start_0
    iget v2, v1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    invoke-interface {v0, v2, p1, p2, p3}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setWifiEnabled(ILjava/lang/String;II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 661
    goto :goto_0

    .line 659
    :catch_0
    move-exception v2

    .line 660
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "setWifiEnabled"

    invoke-direct {p0, v1, v3, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 663
    .end local v1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public setWifiIpAddress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/os/Message;)V
    .locals 16
    .param p1, "ifName"    # Ljava/lang/String;
    .param p2, "ipv4Addr"    # Ljava/lang/String;
    .param p3, "ipv6Addr"    # Ljava/lang/String;
    .param p4, "ipv4PrefixLen"    # I
    .param p5, "ipv6PrefixLen"    # I
    .param p6, "ipv4Gateway"    # Ljava/lang/String;
    .param p7, "ipv6Gateway"    # Ljava/lang/String;
    .param p8, "dnsCount"    # I
    .param p9, "dnsAddresses"    # Ljava/lang/String;
    .param p10, "response"    # Landroid/os/Message;

    .line 711
    move-object/from16 v1, p0

    move-object/from16 v2, p10

    invoke-direct {v1, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v14

    .line 712
    .local v14, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v14, :cond_0

    .line 713
    const/16 v0, 0x847

    iget-object v3, v1, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {v1, v0, v2, v3}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v15

    .line 717
    .local v15, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "> "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v15, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ifName:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v13, p1

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ipv4PrefixLen: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v12, p4

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " ipv6PrefixLen: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v11, p5

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " ipv4Gateway: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v10, p6

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ipv6Gateway: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v9, p7

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " dnsCount: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v8, p8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " dnsAddresses: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v7, p9

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 729
    :try_start_0
    iget v4, v15, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    move-object v3, v14

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move/from16 v8, p4

    move/from16 v9, p5

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    move/from16 v12, p8

    move-object/from16 v13, p9

    invoke-interface/range {v3 .. v13}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setWifiIpAddress(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 735
    goto :goto_0

    .line 733
    :catch_0
    move-exception v0

    .line 734
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "setWifiIpAddressWithDns"

    invoke-direct {v1, v15, v3, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 737
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v15    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    :cond_0
    :goto_0
    return-void
.end method

.method public setWifiPingResult(IIILandroid/os/Message;)V
    .locals 4
    .param p1, "rat"    # I
    .param p2, "latency"    # I
    .param p3, "pktloss"    # I
    .param p4, "response"    # Landroid/os/Message;

    .line 848
    invoke-direct {p0, p4}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v0

    .line 849
    .local v0, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v0, :cond_0

    .line 850
    const/16 v1, 0x854

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {p0, v1, p4, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v1

    .line 854
    .local v1, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " rat = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " latency = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " pktloss = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 860
    :try_start_0
    iget v2, v1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    invoke-interface {v0, v2, p1, p2, p3}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setWifiPingResult(IIII)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 864
    goto :goto_0

    .line 862
    :catch_0
    move-exception v2

    .line 863
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "setWifiPingResult"

    invoke-direct {p0, v1, v3, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 866
    .end local v1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public setWifiSignalLevel(IILandroid/os/Message;)V
    .locals 4
    .param p1, "rssi"    # I
    .param p2, "snr"    # I
    .param p3, "response"    # Landroid/os/Message;

    .line 689
    invoke-direct {p0, p3}, Lcom/mediatek/wfo/ril/MwiRIL;->getRadioProxy(Landroid/os/Message;)Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;

    move-result-object v0

    .line 690
    .local v0, "radioProxy":Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;
    if-eqz v0, :cond_0

    .line 691
    const/16 v1, 0x846

    iget-object v2, p0, Lcom/mediatek/wfo/ril/MwiRIL;->mRILDefaultWorkSource:Landroid/os/WorkSource;

    invoke-direct {p0, v1, p3, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->obtainRequest(ILandroid/os/Message;Landroid/os/WorkSource;)Lcom/mediatek/wfo/ril/RILRequest;

    move-result-object v1

    .line 695
    .local v1, "rr":Lcom/mediatek/wfo/ril/RILRequest;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/mediatek/wfo/ril/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/mediatek/wfo/ril/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/mediatek/wfo/ril/MwiRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " rssi: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " snr:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 700
    :try_start_0
    iget v2, v1, Lcom/mediatek/wfo/ril/RILRequest;->mSerial:I

    invoke-interface {v0, v2, p1, p2}, Lvendor/mediatek/hardware/mtkradioex/V2_0/IMtkRadioEx;->setWifiSignalLevel(III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 703
    goto :goto_0

    .line 701
    :catch_0
    move-exception v2

    .line 702
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "setWifiSignalLevel"

    invoke-direct {p0, v1, v3, v2}, Lcom/mediatek/wfo/ril/MwiRIL;->handleRadioProxyExceptionForRR(Lcom/mediatek/wfo/ril/RILRequest;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 705
    .end local v1    # "rr":Lcom/mediatek/wfo/ril/RILRequest;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method unsljLog(I)V
    .locals 2
    .param p1, "response"    # I

    .line 1349
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[UNSL]< "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/mediatek/wfo/ril/MwiRIL;->responseToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 1350
    return-void
.end method

.method unsljLogMore(ILjava/lang/String;)V
    .locals 2
    .param p1, "response"    # I
    .param p2, "more"    # Ljava/lang/String;

    .line 1353
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[UNSL]< "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/mediatek/wfo/ril/MwiRIL;->responseToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 1354
    return-void
.end method

.method unsljLogRet(ILjava/lang/Object;)V
    .locals 2
    .param p1, "response"    # I
    .param p2, "ret"    # Ljava/lang/Object;

    .line 1357
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[UNSL]< "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/mediatek/wfo/ril/MwiRIL;->responseToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Lcom/mediatek/wfo/ril/MwiRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLog(Ljava/lang/String;)V

    .line 1358
    return-void
.end method

.method unsljLogvRet(ILjava/lang/Object;)V
    .locals 2
    .param p1, "response"    # I
    .param p2, "ret"    # Ljava/lang/Object;

    .line 1361
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[UNSL]< "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/mediatek/wfo/ril/MwiRIL;->responseToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Lcom/mediatek/wfo/ril/MwiRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/wfo/ril/MwiRIL;->riljLogv(Ljava/lang/String;)V

    .line 1362
    return-void
.end method
