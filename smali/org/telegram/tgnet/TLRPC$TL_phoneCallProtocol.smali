.class public Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;
.super Lorg/telegram/tgnet/TLObject;
.source "TLRPC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/telegram/tgnet/TLRPC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TL_phoneCallProtocol"
.end annotation


# static fields
.field public static constructor:I


# instance fields
.field public flags:I

.field public max_layer:I

.field public min_layer:I

.field public udp_p2p:Z

.field public udp_reflector:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28411
    const v0, -0x5d44ca35

    sput v0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->constructor:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28410
    invoke-direct {p0}, Lorg/telegram/tgnet/TLObject;-><init>()V

    return-void
.end method

.method public static TLdeserialize(Lorg/telegram/tgnet/AbstractSerializedData;IZ)Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;
    .locals 6
    .param p0, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;
    .param p1, "constructor"    # I
    .param p2, "exception"    # Z

    .prologue
    .line 28420
    sget v1, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->constructor:I

    if-eq v1, p1, :cond_1

    .line 28421
    if-eqz p2, :cond_0

    .line 28422
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "can\'t parse magic %x in TL_phoneCallProtocol"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 28424
    :cond_0
    const/4 v0, 0x0

    .line 28429
    :goto_0
    return-object v0

    .line 28427
    :cond_1
    new-instance v0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;

    invoke-direct {v0}, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;-><init>()V

    .line 28428
    .local v0, "result":Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;
    invoke-virtual {v0, p0, p2}, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->readParams(Lorg/telegram/tgnet/AbstractSerializedData;Z)V

    goto :goto_0
.end method


# virtual methods
.method public readParams(Lorg/telegram/tgnet/AbstractSerializedData;Z)V
    .locals 3
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;
    .param p2, "exception"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 28433
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v0

    iput v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    .line 28434
    iget v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->udp_p2p:Z

    .line 28435
    iget v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_1

    :goto_1
    iput-boolean v1, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->udp_reflector:Z

    .line 28436
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v0

    iput v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->min_layer:I

    .line 28437
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v0

    iput v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->max_layer:I

    .line 28438
    return-void

    :cond_0
    move v0, v2

    .line 28434
    goto :goto_0

    :cond_1
    move v1, v2

    .line 28435
    goto :goto_1
.end method

.method public serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V
    .locals 1
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;

    .prologue
    .line 28441
    sget v0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->constructor:I

    invoke-virtual {p1, v0}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 28442
    iget-boolean v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->udp_p2p:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    or-int/lit8 v0, v0, 0x1

    :goto_0
    iput v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    .line 28443
    iget-boolean v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->udp_reflector:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    or-int/lit8 v0, v0, 0x2

    :goto_1
    iput v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    .line 28444
    iget v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    invoke-virtual {p1, v0}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 28445
    iget v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->min_layer:I

    invoke-virtual {p1, v0}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 28446
    iget v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->max_layer:I

    invoke-virtual {p1, v0}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 28447
    return-void

    .line 28442
    :cond_0
    iget v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    and-int/lit8 v0, v0, -0x2

    goto :goto_0

    .line 28443
    :cond_1
    iget v0, p0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->flags:I

    and-int/lit8 v0, v0, -0x3

    goto :goto_1
.end method
