.class public Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;
.super Lorg/telegram/tgnet/TLRPC$geochats_Messages;
.source "TLRPC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/telegram/tgnet/TLRPC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TL_geochats_messages"
.end annotation


# static fields
.field public static constructor:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12362
    const v0, -0x2ead924f

    sput v0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->constructor:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12361
    invoke-direct {p0}, Lorg/telegram/tgnet/TLRPC$geochats_Messages;-><init>()V

    return-void
.end method


# virtual methods
.method public readParams(Lorg/telegram/tgnet/AbstractSerializedData;Z)V
    .locals 9
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;
    .param p2, "exception"    # Z

    .prologue
    const v5, 0x1cb5c415

    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 12366
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v2

    .line 12367
    .local v2, "magic":I
    if-eq v2, v5, :cond_0

    .line 12368
    if-eqz p2, :cond_1

    .line 12369
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v5, "wrong Vector magic, got %x"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 12373
    :cond_0
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v1

    .line 12374
    .local v1, "count":I
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_0
    if-ge v0, v1, :cond_3

    .line 12375
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    invoke-static {p1, v4, p2}, Lorg/telegram/tgnet/TLRPC$GeoChatMessage;->TLdeserialize(Lorg/telegram/tgnet/AbstractSerializedData;IZ)Lorg/telegram/tgnet/TLRPC$GeoChatMessage;

    move-result-object v3

    .line 12376
    .local v3, "object":Lorg/telegram/tgnet/TLRPC$GeoChatMessage;
    if-nez v3, :cond_2

    .line 12411
    .end local v0    # "a":I
    .end local v1    # "count":I
    .end local v3    # "object":Lorg/telegram/tgnet/TLRPC$GeoChatMessage;
    :cond_1
    return-void

    .line 12379
    .restart local v0    # "a":I
    .restart local v1    # "count":I
    .restart local v3    # "object":Lorg/telegram/tgnet/TLRPC$GeoChatMessage;
    :cond_2
    iget-object v4, p0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->messages:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12374
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 12381
    .end local v3    # "object":Lorg/telegram/tgnet/TLRPC$GeoChatMessage;
    :cond_3
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v2

    .line 12382
    if-eq v2, v5, :cond_4

    .line 12383
    if-eqz p2, :cond_1

    .line 12384
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v5, "wrong Vector magic, got %x"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 12388
    :cond_4
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v1

    .line 12389
    const/4 v0, 0x0

    :goto_1
    if-ge v0, v1, :cond_5

    .line 12390
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    invoke-static {p1, v4, p2}, Lorg/telegram/tgnet/TLRPC$Chat;->TLdeserialize(Lorg/telegram/tgnet/AbstractSerializedData;IZ)Lorg/telegram/tgnet/TLRPC$Chat;

    move-result-object v3

    .line 12391
    .local v3, "object":Lorg/telegram/tgnet/TLRPC$Chat;
    if-eqz v3, :cond_1

    .line 12394
    iget-object v4, p0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->chats:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12389
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 12396
    .end local v3    # "object":Lorg/telegram/tgnet/TLRPC$Chat;
    :cond_5
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v2

    .line 12397
    if-eq v2, v5, :cond_6

    .line 12398
    if-eqz p2, :cond_1

    .line 12399
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v5, "wrong Vector magic, got %x"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 12403
    :cond_6
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v1

    .line 12404
    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_1

    .line 12405
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    invoke-static {p1, v4, p2}, Lorg/telegram/tgnet/TLRPC$User;->TLdeserialize(Lorg/telegram/tgnet/AbstractSerializedData;IZ)Lorg/telegram/tgnet/TLRPC$User;

    move-result-object v3

    .line 12406
    .local v3, "object":Lorg/telegram/tgnet/TLRPC$User;
    if-eqz v3, :cond_1

    .line 12409
    iget-object v4, p0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->users:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12404
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V
    .locals 4
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;

    .prologue
    const v3, 0x1cb5c415

    .line 12414
    sget v2, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->constructor:I

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 12415
    invoke-virtual {p1, v3}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 12416
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->messages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 12417
    .local v1, "count":I
    invoke-virtual {p1, v1}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 12418
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 12419
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->messages:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/telegram/tgnet/TLRPC$GeoChatMessage;

    invoke-virtual {v2, p1}, Lorg/telegram/tgnet/TLRPC$GeoChatMessage;->serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V

    .line 12418
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 12421
    :cond_0
    invoke-virtual {p1, v3}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 12422
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->chats:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 12423
    invoke-virtual {p1, v1}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 12424
    const/4 v0, 0x0

    :goto_1
    if-ge v0, v1, :cond_1

    .line 12425
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->chats:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/telegram/tgnet/TLRPC$Chat;

    invoke-virtual {v2, p1}, Lorg/telegram/tgnet/TLRPC$Chat;->serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V

    .line 12424
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 12427
    :cond_1
    invoke-virtual {p1, v3}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 12428
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->users:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 12429
    invoke-virtual {p1, v1}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 12430
    const/4 v0, 0x0

    :goto_2
    if-ge v0, v1, :cond_2

    .line 12431
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_geochats_messages;->users:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/telegram/tgnet/TLRPC$User;

    invoke-virtual {v2, p1}, Lorg/telegram/tgnet/TLRPC$User;->serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V

    .line 12430
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 12433
    :cond_2
    return-void
.end method
